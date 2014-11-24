module Rails
  module JS
    module Routes
      module ViewHelpers
        def js_routes

          namespace = controller_path.split('/').reject do |el|
            el == controller_name
          end.join

          raw [
            '<script type="text/javascript">',
              'window.Rails = window.Rails || {};',
              'Rails.config = {',
              "  controller: '#{controller_name}',",
              "  namespace: '#{namespace}',",
              "  action: '#{action_name}'",
              '};',
            '</script>'
          ].join("\n")
        end
      end
    end
  end
end
