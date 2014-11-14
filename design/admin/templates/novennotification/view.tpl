{def
    $title_curr = ''
    $chaine_theme_title = ''
    $alerte_type_title = ''
    $title_prec = ''
    $chaine_theme_title_prec = ''
    $alerte_type_title_prec = ''
    $subscribed_nodes_count=$subscribed_nodes|count
}

{* DESIGN: Header START *}
<div class="novennotification-header">
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
<div class="novennotification-content">
	<div class="box-mr">
		<div class="box-content">
			<div class="context-attributes">
				{if $user}
				<div class="object">
					{$user.contentobject.name} - {$user.login} - <a href="mailto:{$user.email}">{$user.email}</a>
				</div>
				{/if}

<form method="post" name="notificationcontrol" action={concat('/notificationcontrol/view/(user)/',$user.contentobject_id)|ezurl}>

				{if $subscribed_nodes|count}

                    <table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tr>
			       <th class="tight">
        <img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}" title="{'Invert selection.'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}" onclick="ezjs_toggleCheckboxes( document.notificationcontrol, 'SelectedRuleIDArray_ezsubtree[]' ); return false;"/>
    </th>
	                    <th>{'Name'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</th>
	                    <th>{'Type'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</th>
	                    <th>{'Section'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</th>
                    </tr>


                    {foreach $subscribed_nodes as $index=>$rule sequence array('bgdark', 'bglight') as $seq}
                    <tr class="{$seq}">
                        <td><input type="checkbox" name="SelectedRuleIDArray_ezsubtree[]" value="{$rule.node_id}" /></td>
                        <td>{$rule.node.class_identifier|class_icon( small, $rule.node.class_name )}&nbsp;<a href={concat( '/content/view/full/', $rule.node.node_id, '/' )|ezurl}>{$rule.node.name|wash}</a></td>
	                    <td>{$rule.node.object.content_class.name|wash}</td>
                        <td>{let section_object=fetch( section, object, hash( section_id, $rule.node.object.section_id ) )}{section show=$section_object}{$section_object.name|wash}{section-else}<i>{'Unknown'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</i>{/section}{/let}</td>
                    </tr>
					{/foreach}
                    </table>

				{else}
					<p>{'No notifications for this user'|i18n('extension/novennotification/view')}</p>
				{/if}


		{* DESIGN: Content END *}
{def $remove_count=$nodelist|count
     $remain_count = sub($subscribed_nodes_count,$remove_count)
}

<div class="novennotification-buttonblock">
{if $subscribed_nodes_count}
<input class="button" type="submit" name="RemoveRule_{$remove_id}" value="{'Remove selected'|i18n( 'design/admin/templates/novennotification/view' )}" />
{/if}

</div></form>  </div>

{if $remove_count|gt(1)}
<div class="warning" style="color:red; margin-top:50px;"> {$remove_count} notifications successfully removed</div>
{/if}
{undef $remove_count}




		</div>
	</div>
</div>



<div class="novennotification-controlbar">
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
