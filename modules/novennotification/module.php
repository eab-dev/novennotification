<?php

//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: Noven Notification
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

$Module = array('name' => 'novennotification');

$ViewList = array();

/*
 * list of users
 */
$ViewList['list'] = array(
	'script'					=>	'list.php',
	'params'					=> 	array(),
	'unordered_params'			=> 	array( 'group' => 'Group', 'offset' => 'Offset' ),
	'single_post_actions'		=> 	array(),
	'post_action_parameters'	=> 	array(),
	'default_navigation_part'	=> 'novennotificationnavigationpart',
);

/*
 * user notification details
 */
$ViewList['view'] = array(
	'script'					=>	'view.php',
	'params'					=> 	array(),
	'unordered_params'          =>  array(  'user' => 'UserID' ),
	'single_post_actions'		=>  array(),
	'post_action_parameters'	=> 	array(),
	'default_navigation_part'	=> 'novennotificationnavigationpart',
);

