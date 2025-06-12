module Views
  module Layouts
    class Application < Views::Base
      include Phlex::Rails::Helpers::CSRFMetaTags
      include Phlex::Rails::Helpers::CSPMetaTag
      include Phlex::Rails::Helpers::StyleSheetLinkTag
      include Phlex::Rails::Helpers::JavaScriptImportmapTags

      def initialize(title:)
        @title = title
      end

      def view_template
        doctype
        html do
          head do
            title { @title || "Hyperbean" }
            meta(name: "viewport", content: "width=device-width,initial-scale=1")
            meta(name: "apple-mobile-web-app-capable", content: "yes")
            meta(name: "mobile-web-app-capable", content: "yes")

            csrf_meta_tags
            csp_meta_tag
            stylesheet_link_tag :app, "data-turbo-track": "reload"
            javascript_importmap_tags
          end

          body(class: "w-screen p-0 m-0") do
            Tabs(default_value: "devices", class: "w-screen") do
              header(class: "flex flex-row gap-3 justify-between items-center px-6 py-3 sticky top-0 bg-white/50 border-b border-gray-200") {
                TabsList do
                  TabsTrigger(value: "devices") { "Devices" }
                  TabsTrigger(value: "people") { "People" }
                end

                Components::UserButton()
              }
              main(class: "container mx-auto mt-28 px-5 flex") do
                yield
              end
            end
          end
        end
      end
    end
  end
end
