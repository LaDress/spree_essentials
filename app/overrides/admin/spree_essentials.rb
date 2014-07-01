# Adds the Content button to the admin tabs
Deface::Override.new(:virtual_path  => "spree/admin/shared/_menu",
                     :name          => "spree_essential_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :partial       => "spree/admin/shared/contents_tab",
                     :disabled      => false)

