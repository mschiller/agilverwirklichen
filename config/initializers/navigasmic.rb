Navigasmic.setup do |config|

  # Defining Navigation Structures:
  #
  # You can define your navigation structures and configure the builders in this initializer.
  #
  # When defining navigation here, it's important to understand that the scope is not the same as the view scope -- and
  # you should use procs where you want things to execute in the view scope.
  #
  # Once you've defined some navigation structures and configured your builders you can render navigation in your views
  # using the `semantic_navigation` view helper.  You can also use the same syntax to define your navigation structures
  # in your views -- and eventually move them here if you want.
  #
  # <%= semantic_navigation :primary %>
  #
  # You can optionally provided a :builder and :config option to the semantic_navigation view helper.
  #
  # <%= semantic_navigation :primary, config: :blockquote %>
  # <%= semantic_navigation :primary, builder: Navigasmic::Builder::MapBuilder %>
  #
  # When defining navigation in your views just pass it a block.
  #
  # <%= semantic_navigation :primary do |n| %>
  #   <% n.item 'About Me' %>
  # <% end %>
  #

  # Setting the Default Builder:
  #
  # By default the Navigasmic::Builder::ListBuilder is used unless otherwise specified.
  #
  # You can change this here:
  #config.default_builder = MyCustomBuilder

end if defined?(Navigasmic)
