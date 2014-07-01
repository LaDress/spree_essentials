module Spree::Admin::SpreeEssentialsHelper

  def inside_contents_tab?
    @inside_contents_tab ||= !request.fullpath.scan(Regexp.new(extension_routes.join("|"))).empty?
  end

  def contents_tab
    content_tag :li, class: "tab-with-icon #{'selected' if inside_contents_tab?}" do
      link_to extension_routes.first, class: 'icon_link with-tip icon-pencil' do
        content_tag :span, I18n.t('spree.admin.shared.contents_tab.content')
      end
    end
  end

  def markdown_helper
    content_tag('em', :class => 'small markdown-helper') do
      [
        t('essentials.parsed_with'),
        link_to("Markdown", "http://daringfireball.net/projects/markdown/basics", :onclick => 'window.open(this.href); return false')
      ].join(" ").html_safe
    end
  end

private

  def extension_routes
    @extension_routes ||= SpreeEssentials.essentials.map { |key, cls|
      route = cls.tab[:route] || "admin_#{key}"
      send("#{route}_path") rescue "##{key}"
    }.push(spree.admin_uploads_path)
  end

end
