/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/* jshint esversion: 6 */
/* jshint browser: true */

'use strict';

var memoizedPagefindPanel = null;
function getPagefindPanel() {
    if (memoizedPagefindPanel == null) {
        const pagefindPanel = document.getElementById('pagefind-panel');
        if (!pagefindPanel) {
            window.alert('Pagefind panel not found!');
            throw new Error('Pagefind panel not found!');
        }

        memoizedPagefindPanel = pagefindPanel;
    }

    return memoizedPagefindPanel;
}

var memoizedPagefindInput = null;
function getPagefindInput() {
    if (memoizedPagefindInput == null) {
        const pagefindInput = getPagefindPanel().querySelector('input[type="text"]');
        if (!pagefindInput) {
            window.alert('Search input not found in the Pagefind panel!');
            throw new Error('Search input not found in the Pagefind panel!');
        }

        memoizedPagefindInput = pagefindInput;
    }
    return memoizedPagefindInput;
}

var memoizedPagefindPanelToggleButton = null;
function getPagefindPanelToggleButton() {
    if (memoizedPagefindPanelToggleButton == null) {
        const button = document.getElementById('pagefind-panel-toggle-button');
        if (!button) {
            window.alert('Search toggle button not found!');
            throw new Error('Search toggle button not found!');
        }

        memoizedPagefindPanelToggleButton = button;
    }
    return memoizedPagefindPanelToggleButton;
}

var memoizedPagefindCloseButton = null;
function getPagefindCloseButton() {
    if (memoizedPagefindCloseButton == null) {
        const button = getPagefindPanel().querySelector('button.pagefind-ui__search-clear');
        if (!button) {
            window.alert('Pagefind close button not found!');
            throw new Error('Pagefind close button not found!');
        }
        memoizedPagefindCloseButton = button;
    }
    return memoizedPagefindCloseButton;
}

function hidePagefindPanel() {
    getPagefindPanel().style.display = 'none';
    getPagefindPanelToggleButton().style.visibility = 'visible';
    getPagefindInput().blur();
}

function showPagefindPanel() {
    if (location.protocol === 'file:') {
        window.alert('PLEASE NOTE: ' +
            'Due to the security restrictions of browsers (same origin policy), search is only expected to work ' +
            'if you visit via HTTP(S), and not via a "file:" URL. For local testing, use something like ' +
            '"npx http-server"!');
    }

    getPagefindPanel().style.display = 'block';
    getPagefindPanelToggleButton().style.visibility = 'hidden';
    getPagefindInput().focus();

    getPagefindCloseButton().style.visibility = 'visible';
}

function togglePagefindPanel() {
    const pagefindPanel = getPagefindPanel();
    if (pagefindPanel.style.display === 'none' || pagefindPanel.style.display === '') {
        showPagefindPanel();
    } else {
        hidePagefindPanel();
    }
}

function addDocgenPagefindCustomizations() {
    const searchInput = getPagefindInput();

    // Input auto-hiding:
    searchInput.addEventListener('blur', () => {
        if (searchInput.value === '') {
            hidePagefindPanel();
        }
    });
    searchInput.addEventListener('keydown', (event) => {
        if (event.key === 'Escape') {
            hidePagefindPanel();
        }
    });

    const closeButton = getPagefindCloseButton();
    closeButton.addEventListener('click', (event) => {
        hidePagefindPanel();
    });

    hidePagefindPanel();
}

window.addEventListener('DOMContentLoaded', (event) => {
    /*jshint -W117 */
    new PagefindUI({ element: '#pagefind-panel', showSubResults: true });
    /*jshint -W117 */
    addDocgenPagefindCustomizations();
});
