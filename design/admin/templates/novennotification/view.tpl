{def
    $title_curr = ''
    $chaine_theme_title = ''
    $alerte_type_title = ''
    $title_prec = ''
    $chaine_theme_title_prec = ''
    $alerte_type_title_prec = ''
}
{include uri="design:novennotification/no_left_menu.tpl"}


{* DESIGN: Header START *}
<div class="box-header">
	<div class="box-tc">
		<div class="box-ml">
			<div class="box-mr">
				<div class="box-tl">
					<div class="box-tr">
						<h1 class="context-title">{'User notification'|i18n('extension/novennotification/view')}</h1>

						{* DESIGN: Mainline *}<div class="header-mainline"></div>

						{* DESIGN: Header END *}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

{* DESIGN: Content START *}
<div class="box-ml">
	<div class="box-mr">
		<div class="box-content">
			<div class="context-attributes">
				{if $user}
				<div class="object">
					{$user.contentobject.name} - {$user.login} - <a href="mailto:{$user.email}">{$user.email}</a>
				</div>
				{/if}
				
				{if $subscribed_nodes|count}

                    <table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tr>
	                    <th>{'Name'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</th>
	                    <th>{'Type'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</th>
	                    <th>{'Section'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</th>
                    </tr>
                    {foreach $subscribed_nodes as $index=>$rule sequence array('bgdark', 'bglight') as $seq}
                    <tr class="{$seq}">
                        <td>{$rule.node.class_identifier|class_icon( small, $rule.item.node.class_name )}&nbsp;<a href={concat( '/content/view/full/', $rule.node.node_id, '/' )|ezurl}>{$rule.node.name|wash}</a></td>
	                    <td>{$rule.node.object.content_class.name|wash}</td>
                        <td>{let section_object=fetch( section, object, hash( section_id, $rule.node.object.section_id ) )}{section show=$section_object}{$section_object.name|wash}{section-else}<i>{'Unknown'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</i>{/section}{/let}</td>
                    </tr>
                    {/section}
                    </table>

				{else}
					<p>{'No notification for this user'|i18n('extension/novennotification/view')}</p>
				{/if}
				
			</div>
		{* DESIGN: Content END *}
		</div>
	</div>
</div>

<div class="controlbar">
	<div class="box-bc">
		<div class="box-ml">
			<div class="box-mr">
				<div class="box-tc">
					<div class="box-bl">
						<div class="box-br"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
