
{* DESIGN: Header START *}
<div class="box-header">
	<div class="box-tc">
		<div class="box-ml">
			<div class="box-mr">
				<div class="box-tl">
					<div class="box-tr">
						<h1 class="context-title">{'Select the user group'|i18n('extension/novennotification/list')}</h1>

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
				{if $groupNodeIDs|count}
				<div class="object">
					<p>{'Please select the group to display'|i18n('extension/novennotification/list')}</p>
					<br />
					<div class="element">
						<select name="selectedGroup" onchange="window.location.href='/notificationcontrol/list/(group)/'+this.value+'/(offset)/0';">
							{def $gNode = ""}
							{foreach $groupNodeIDs as $gNodeID}
								{set $gNode = fetch( 'content', 'node', hash( 'node_id', $gNodeID ) )}
								<option value="{$gNode.node_id}"{if eq($selectedGroup,$gNode.node_id)} selected="selected"{def $groupName = $gNode.name}{/if}>{$gNode.name}</option>
							{/foreach}
						</select>
					</div>
				</div>
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

<div>&nbsp;</div>

{if $users|count}

	{* DESIGN: Header START *}
	<div class="box-header">
		<div class="box-tc">
			<div class="box-ml">
				<div class="box-mr">
					<div class="box-tl">
						<div class="box-tr">
							<h1 class="context-title">{'Users for group %group'|i18n('extension/novennotification/list',, hash( '%group', $groupName))}</h1>
							{* DESIGN: subline *}<div class="header-subline"></div>

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
					<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<th class="tight">{'Name'|i18n( 'extension/novennotification/list' )}</th>
							<th class="tight">{'Login'|i18n( 'extension/novennotification/list' )}</th>
							<th class="tight">{'Email address'|i18n( 'extension/novennotification/list' )}</th>
							<th class="tight">&nbsp;</th>
						</tr>
						{foreach $users as $user sequence array('bgdark', 'bglight') as $seq}
						<tr valign="top" class="{$seq}">
							<td width="33%">
						{if $user.class_identifier|eq('user_group')}<a href={concat('notificationcontrol/list/(group)/', $user.node_id, '/(offset)/0')|ezurl}>{$user.name}</a>{else}{$user.name}{/if}</td>
							<td width="33%">{$user.data_map.user_account.content.login}</td>
							<td width="33%"><a href="mailto:{$user.data_map.user_account.content.email}">{$user.data_map.user_account.content.email}</a></td>
							<td width="1">
						{if $user.class_identifier|ne('user_group')}
								<a href={concat('notificationcontrol/view/(user)/', $user.contentobject_id)|ezurl} title="{'View notifications for this user'|i18n('extension/novennotification/list')}">
									<img src={"share/icons/crystal-admin/16x16_indexed/mimetypes/empty.png"|ezroot} alt="{'View notifications for this user'|i18n('extension/novennotification/list')}" />
								</a>{/if}
							</td>
						</tr>
						{/foreach}
					</table>

					<p>&nbsp;</p>
					<p class="pagination">
					Page :
					{* Pagination links *}
					{def
						$nbPages = $totalUsers|div($limit)|ceil
						$offset = ""
					}
					{for 1 to $nbPages as $i}
						{set $offset = $i|sub(1)|mul($limit)}
						<a href={concat($uri, '(offset)/', $offset)|ezurl}>{$i}</a>
					{/for}
					</p>

				</div>
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

{/if}
