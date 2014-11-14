{def $ancestor = fetch( 'content' , 'node', hash( 'node_id', 5 ))}

<h4>User Groups</h4>
<ul>
{foreach $ancestor.children as $child}
	{if $child.class_identifier|eq( 'user_group' )}
	<li><a href={concat('notificationcontrol/list/(group)/', $child.node_id, '/(offset)/0')|ezurl}>{$child.name|wash}</a></li>
	{/if}
{/foreach}
</ul>
