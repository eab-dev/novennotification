{def $ancestor = fetch('content','node',hash('node_id',5))}

<div style="width:150px;">
	<ul>
	{foreach $ancestor.children as $eachone}
		{if $eachone.class_identifier|eq('user_group')}
		<li> <a href={concat('notificationcontrol/list/(group)/', $eachone.node_id, '/(offset)/0')|ezurl} >{$eachone.name|wash}</a> </li>
		{/if}
	{/foreach}
	</ul>
</div>
