
<cfset resp = request.Cflickr.service.photos_getRecent(per_page=25, page=1) />

<h3>Recent Public Photos<h3>
<div style="width:400px;">
<cfloop from="1" to="#arraylen(resp.photos.photo)#" index="i">
	<cfset p = resp.photos.photo[i] />

	<cfoutput>
    <a href="http://flickr.com/photo.gne?id=#p.id#">
		<img src="#request.Cflickr.service.getPhotoUrl(p, 's')#" />
    </a>
	</cfoutput>

</cfloop>
<div>

