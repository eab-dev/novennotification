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

include_once( "kernel/common/template.php" );

$Module =& $Params["Module"];
$Result = array();
$tpl = templateInit();
$http = eZHTTPTool::instance();

$notiINI = eZINI::instance('novennotification.ini');

// Autorized groups to display
$groupNodeIDs = $notiINI->variable('GroupSettings', 'UserGroupNodeIDs');
$tpl->setVariable( 'groupNodeIDs', $groupNodeIDs );

// Offset for pagination
if ( $Params['Offset'] )
{
    $offset = (int) $Params['Offset'];
}
else
{
    $offset = 0;
}

if ( $Params['Group'] )
{
    $selectedGroup = $Params['Group'];
}
else
{
    $selectedGroup = $groupNodeIDs[0];
}

$limit = (int) $notiINI->variable( 'GroupSettings', 'Limit' );

// Get users list
$users = eZFunctionHandler::execute( 'content', 'list', array(	'parent_node_id'    => $selectedGroup,
                                                                'depth'             => '1',
                                                    		    'offset'            => $offset,
                                                                'limit'             => $limit,
                                                                'sort_by'           => array( 'name', true ) ) );

$totalUsers = eZFunctionHandler::execute( 'content', 'list_count', array(   'parent_node_id'    => $selectedGroup,
                                                                            'depth'             => '1' ) );

$tpl->setVariable( 'totalUsers', $totalUsers );
$tpl->setVariable( 'limit', $limit );
$tpl->setVariable( 'users', $users );

$currentURI = '/'.$Module->currentModule().'/'.$Module->currentView().'/(group)/'.$selectedGroup.'/';
$tpl->setVariable('uri', $currentURI);
$tpl->setVariable( 'selectedGroup', $selectedGroup );

$Result['content'] = $tpl->fetch( "design:novennotification/list.tpl" );
$Result['path'] = array(
                        array(  'url'   => false,
                                'text'  => ezi18n( 'extension/novennotification', 'Users notification settings' ) ) );

