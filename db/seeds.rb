client = Client.create(name: "John Hamelink")
client.client_data.create(
  key: "name",
  value: "John Hamelink"
)
client.client_data.create(
  key: "date_of_birth",
  value: "07/04/1993"
)
client.client_data.create(
  key: "paragraph_content",
  value: """

  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.
  Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec
  consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget
  libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut
  porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula ultricies
  a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean
  ut gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id
  dolor. Pellentesque auctor nisi id magna consequat sagittis. Curabitur
  dapibus enim sit amet elit pharetra tincidunt feugiat nisl imperdiet. Ut
  convallis libero in urna ultrices accumsan. Donec sed odio eros. Donec
  viverra mi quis quam pulvinar at malesuada arcu rhoncus. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus. In rutrum
  accumsan ultricies. Mauris vitae nisi at sem facilisis semper ac in est.

  Vivamus fermentum semper porta. Nunc diam velit, adipiscing ut tristique
  vitae, sagittis vel odio. Maecenas convallis ullamcorper ultricies. Curabitur
  ornare, ligula semper consectetur sagittis, nisi diam iaculis velit, id
  fringilla sem nunc vel mi. Nam dictum, odio nec pretium volutpat, arcu ante
  placerat erat, non tristique elit urna et turpis. Quisque mi metus, ornare
  sit amet fermentum et, tincidunt et orci. Fusce eget orci a orci congue
  vestibulum. Ut dolor diam, elementum et vestibulum eu, porttitor vel elit.
    Curabitur venenatis pulvinar tellus gravida ornare. Sed et erat faucibus
  nunc euismod ultricies ut id justo. Nullam cursus suscipit nisi, et ultrices
  justo sodales nec. Fusce venenatis facilisis lectus ac semper. Aliquam at
  massa ipsum. Quisque bibendum purus convallis nulla ultrices ultricies.
    Nullam aliquam, mi eu aliquam tincidunt, purus velit laoreet tortor,
    viverra pretium nisi quam vitae mi. Fusce vel volutpat elit. Nam sagittis
  nisi dui.

  """
)
client.client_data.create(
  key: "interpolated_content",
  value: "This is interpolated content, and is being sent by {{sender.name}}, of: <br/> {{sender.address}}"
)
client.client_data.create(
  key: "interpolated_content_with_errors",
  value: "Error messages here: {{blerg}}, here: {{sender.blerg}}, and here: {{sender.blerg.lorem}}"
)

DocumentTemplate.create(name: "Example", view_key: "example_document")
