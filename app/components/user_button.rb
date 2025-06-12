class Components::UserButton < Components::Base
  def view_template
    div(class: "rounded-full overflow-hidden border border-gray-200 size-10") {
      "Hello"
    }
  end
end
