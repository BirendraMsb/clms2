/**
 * CLMS Responsive Mobile Navbar & Sub-menu System
 * Handles hamburger toggler, sub-menu accordion expand/collapse on small screens,
 * desktop hover/click compatibility, and outside-click dismissal.
 */
(function ($) {
    'use strict';

    function initNavbar() {
        // 1. Initial State: Ensure collapsed navbar is closed on small screens on load
        if ($(window).width() < 992) {
            $('#navbarColor02').removeClass('show');
            $('.navbar-toggler').attr('aria-expanded', 'false');
        }

        // 2. Mobile Hamburger Button Toggler
        $(document).off('click.navbarToggle', '.navbar-toggler').on('click.navbarToggle', '.navbar-toggler', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var target = $(this).attr('data-bs-target') || $(this).attr('data-target') || '#navbarColor02';
            var $menu = $(target);
            $menu.toggleClass('show');
            var isOpen = $menu.hasClass('show');
            $(this).attr('aria-expanded', isOpen ? 'true' : 'false');
        });

        // 3. Dropdown Sub-menu Toggle (Works on small screens and touch devices)
        $(document).off('click.dropdownToggle', '.navbar .dropdown-toggle').on('click.dropdownToggle', '.navbar .dropdown-toggle', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var $toggle = $(this);
            var $dropdown = $toggle.closest('.dropdown');
            var $menu = $dropdown.children('.dropdown-menu');
            var isCurrentlyOpen = $menu.hasClass('show') || $dropdown.hasClass('show');

            // Close other sibling dropdowns in the same navbar
            $dropdown.siblings('.dropdown').removeClass('show').children('.dropdown-menu').removeClass('show');
            $dropdown.siblings('.dropdown').find('.dropdown-toggle').attr('aria-expanded', 'false');

            if (!isCurrentlyOpen) {
                $dropdown.addClass('show');
                $menu.addClass('show');
                $toggle.attr('aria-expanded', 'true');
            } else {
                $dropdown.removeClass('show');
                $menu.removeClass('show');
                $toggle.attr('aria-expanded', 'false');
            }
        });

        // 4. Sub-menu Item Navigation: Allow clicks on dropdown links to navigate cleanly
        $(document).off('click.dropdownItem', '.navbar .dropdown-menu a.dropdown-item').on('click.dropdownItem', '.navbar .dropdown-menu a.dropdown-item', function (e) {
            e.stopPropagation();
            if ($(window).width() < 992) {
                // On mobile, close navbar after navigating
                setTimeout(function () {
                    $('#navbarColor02').removeClass('show');
                    $('.navbar-toggler').attr('aria-expanded', 'false');
                    $('.navbar .dropdown, .navbar .dropdown-menu').removeClass('show');
                }, 100);
            }
        });

        // 5. Outside Click: Dismiss open dropdowns and mobile menu
        $(document).off('click.navbarOutside').on('click.navbarOutside', function (e) {
            if (!$(e.target).closest('.navbar .dropdown').length) {
                $('.navbar .dropdown, .navbar .dropdown-menu').removeClass('show');
                $('.navbar .dropdown-toggle').attr('aria-expanded', 'false');
            }
            if ($(window).width() < 992) {
                if (!$(e.target).closest('nav.navbar').length) {
                    $('#navbarColor02').removeClass('show');
                    $('.navbar-toggler').attr('aria-expanded', 'false');
                }
            }
        });

        // 6. Non-dropdown nav links: Close mobile menu on click
        $(document).off('click.navLinkDirect', '.navbar-collapse a:not(.dropdown-toggle):not(.dropdown-item)').on('click.navLinkDirect', '.navbar-collapse a:not(.dropdown-toggle):not(.dropdown-item)', function () {
            if ($(window).width() < 992) {
                $('#navbarColor02').removeClass('show');
                $('.navbar-toggler').attr('aria-expanded', 'false');
            }
        });
    }

    // Initialize when DOM is ready
    if (typeof jQuery !== 'undefined') {
        $(document).ready(initNavbar);
    } else {
        document.addEventListener('DOMContentLoaded', function () {
            if (typeof jQuery !== 'undefined') {
                $(document).ready(initNavbar);
            }
        });
    }
})(jQuery);

