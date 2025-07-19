module ApplicationHelper
    def nav_link(text, path, options = {})
  current = current_page?(path)
  options[:class] ||= ""
  options[:class] += current ? " text-blue-600 font-semibold" : " text-gray-700 hover:text-blue-500"
  link_to text, path, options
end

def mobile_nav_link(text, path, options = {})
    base_classes = "block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
    active_classes = "text-white bg-blue-600"
    inactive_classes = "text-gray-700 hover:text-white hover:bg-blue-500"
    
    current = current_page?(path)
    options[:class] = [options[:class], base_classes, (current ? active_classes : inactive_classes)].compact.join(' ')
    
    link_to(text, path, options)
  end
end
