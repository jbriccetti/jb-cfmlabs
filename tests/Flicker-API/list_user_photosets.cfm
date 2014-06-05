
<cfif structKeyExists(url, "photoset_id")>

	<cfset info = request.Cflickr.service.photosets_getInfo(photoset_id=url.photoset_id, auth_token=request.Cflickr.token) />
	<cfset photos = request.Cflickr.service.photosets_getPhotos(photoset_id=url.photoset_id, auth_token=request.Cflickr.token) />
	
	<h3>Photos in set
		<cfoutput>
		<a href="http://www.flickr.com/photos/#request.Cflickr.userid#/sets/#url.photoset_id#/">#info.photoset.title#</a>
		</cfoutput>
	</h3>
	
	<div style="width:400px;">
	<cfloop from="1" to="#arraylen(photos.photoset.photo)#" index="i">
		<cfset p = photos.photoset.photo[i] />
		<cfoutput>
		<a href="http://flickr.com/photo.gne?id=#p.id#"><img src="#request.Cflickr.service.getPhotoUrl(p, 's')#" /></a>
		</cfoutput> 
	</cfloop>

	</div>	

<cfelse>

	<cfset resp = request.Cflickr.service.photosets_getList(user_id=request.Cflickr.userid, auth_token=request.Cflickr.token) />
	<cfdump var="#resp#" abort />
	<h3>Your photosets<h3>
	<div style="width:400px;">
	<cfloop from="1" to="#arraylen(resp.photosets.photoset)#" index="i">
		<cfset ps = resp.photosets.photoset[i] />
		
		<cfoutput>
		<a href="?photoset_id=#ps.id#"><img src="#request.Cflickr.service.getPhotoUrl(ps, 's')#" /></a>
		</cfoutput>
	
	</cfloop>
	</div>


</cfif>

