module Views
  class Index < Views::Base
    def view_template
      render Layouts::Application.new(title: 'Home') do
        body do
          h1 { 'Home' }
        end
      end
    end
  end
end
