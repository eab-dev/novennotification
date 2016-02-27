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

    $db = eZDB::instance();
    $db->begin();

    $availableHandlers = eZNotificationEventFilter::availableHandlers();

    $tpl->setVariable('user', $user);

    if ( isset( $availableHandlers[ 'ezgeneraldigest' ] ))
    {
        $digestHandler = new eZGeneralDigestHandler();
        $settings = $digestHandler->settings( $user );

        if ( $http->hasPostVariable( 'Store' )) {
            storeDigestSettings( $http, $settings );
        }

        $tpl->setVariable( 'digest_handler', $digestHandler );
        $tpl->setVariable( 'digest_settings', $settings );
    }

    if ( $http->hasPostVariable( 'SelectedRuleIDArray_' . eZSubTreeHandler::NOTIFICATION_HANDLER_ID ) )
    {
        $removeNodeIDList = $http->postVariable( 'SelectedRuleIDArray_' . eZSubTreeHandler::NOTIFICATION_HANDLER_ID );
        foreach( $removeNodeIDList as $nodeID )
            eZSubtreeNotificationRule::removeByNodeAndUserID($userContentObjectID, $nodeID );
        $tpl->setVariable( 'remove_count', count( $removeNodeIDList ));
    }
    else
        $tpl->setVariable( 'remove_count', 0 );

     $db->commit();

    $tpl->setVariable('remove_id', eZSubTreeHandler::NOTIFICATION_HANDLER_ID );
    $subscribedNodes = eZSubTreeHandler::rules( $user, 0, 500 );
    $tpl->setVariable('subscribed_nodes', $subscribedNodes );
    $tpl->setVariable('subscribed_nodes_count', count( $subscribedNodes ));
}

$Result['content'] = $tpl->fetch( "design:novennotification/view.tpl" );
$Result['left_menu'] = "design:parts/novennotification/menu.tpl";
$Result['path'] = array(
                        array(  'url'   => '/notificationcontrol/list', 'text'  => ezpI18n::tr( 'extension/novennotification', 'Users notification settings' ) ),
			array(  'url'   => false, 'text'  => $user->Email )
		);

function storeDigestSettings( $http, $settings )
{
    if ( $http->hasPostVariable( 'ReceiveDigest_' . eZGeneralDigestHandler::NOTIFICATION_HANDLER_ID ) &&
         $http->hasPostVariable( 'ReceiveDigest_' . eZGeneralDigestHandler::NOTIFICATION_HANDLER_ID ) == '1' )
    {
        $settings->setAttribute( 'receive_digest', 1 );
        $digestType = $http->postVariable( 'DigestType_' . eZGeneralDigestHandler::NOTIFICATION_HANDLER_ID );
        $settings->setAttribute( 'digest_type', $digestType );
        if ( $digestType == 1 )
        {
            $settings->setAttribute( 'day', $http->postVariable( 'Weekday_' . eZGeneralDigestHandler::NOTIFICATION_HANDLER_ID ) );
        }
        else if ( $digestType == 2 )
        {
            $settings->setAttribute( 'day', $http->postVariable( 'Monthday_' . eZGeneralDigestHandler::NOTIFICATION_HANDLER_ID ) );
        }
        $settings->setAttribute( 'time', $http->postVariable( 'Time_' . eZGeneralDigestHandler::NOTIFICATION_HANDLER_ID ) );
        $settings->store();
    }
    else
    {
        $settings->setAttribute( 'receive_digest', 0 );
        $settings->store();
    }
}
