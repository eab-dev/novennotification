<?php

//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: Noven notification
// SOFTWARE RELEASE: 1.0.0
// COPYRIGHT NOTICE: Copyright (C) 2009 - Jean-Luc Nguyen, Noven.
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//
// ## END COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
//

$http = eZHTTPTool::instance();
$Module =& $Params["Module"];
$Result = array();
$tpl = eZTemplate::factory();

if ( $Params['UserID'] )
{
	$userContentObjectID = $Params['UserID'];
	$user = eZUser::fetch($userContentObjectID);
	$tpl->setVariable('user', $user);

	$nodeIDlist = $_POST['SelectedRuleIDArray_ezsubtree'];
	//$nodeIDlist = $http->postVariable( 'SelectedRuleIDArray_ezsubtree' );

	foreach( $nodeIDlist as $nodeID )
	{
		$RemoveID = eZSubtreeNotificationRule::removeByNodeAndUserID($userContentObjectID, $nodeID );
		$tpl->setVariable('remove_id', $RemoveID);
	}

	$tpl->setVariable('nodelist', $nodeIDlist);
	$subscribedNodes = eZSubTreeHandler::rules( $user, 0, 500 );
	$tpl->setVariable('subscribed_nodes', $subscribedNodes);
}

$Result['content'] = $tpl->fetch( "design:novennotification/view.tpl" );
$Result['path'] = array(
                        array(  'url'   =>false,
                                'text'  => ezpI18n::tr( 'extension/novennotification', 'Users notification settings' ) ) );
