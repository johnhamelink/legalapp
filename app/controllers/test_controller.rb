class TestController < ApplicationController

  def index
    @document = { 'title' => 'Lorem Ipsum' }
    @sender = {
      'name' => 'John Hamelink',
      'address' => "1/3 30 Handel Place\nNew Gorbals\nGlasgow",
      'postcode' => 'G50TP'
    }
    @receiver = {
      'name' => 'Alastair Bokla',
      'address' => "1/3 30 Handel Place\nNew Gorbals\nGlasgow",
      'postcode' => 'G50TP'
    }

    @paragraph_content = """

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam
    lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra
    nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam
    eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim,
      ut porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula
    ultricies a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing
    elit. Aenean ut gravida lorem. Ut turpis felis, pulvinar a semper sed,
      adipiscing id dolor. Pellentesque auctor nisi id magna consequat
    sagittis. Curabitur dapibus enim sit amet elit pharetra tincidunt feugiat
    nisl imperdiet. Ut convallis libero in urna ultrices accumsan. Donec sed
    odio eros. Donec viverra mi quis quam pulvinar at malesuada arcu rhoncus.
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur
    ridiculus mus. In rutrum accumsan ultricies. Mauris vitae nisi at sem
    facilisis semper ac in est.

    Vivamus fermentum semper porta. Nunc diam velit, adipiscing ut tristique vitae,
    sagittis vel odio. Maecenas convallis ullamcorper ultricies. Curabitur ornare,
    ligula semper consectetur sagittis, nisi diam iaculis velit, id fringilla sem
    nunc vel mi. Nam dictum, odio nec pretium volutpat, arcu ante placerat erat,
    non tristique elit urna et turpis. Quisque mi metus, ornare sit amet fermentum
    et, tincidunt et orci. Fusce eget orci a orci congue vestibulum. Ut dolor
    diam, elementum et vestibulum eu, porttitor vel elit. Curabitur venenatis
    pulvinar tellus gravida ornare. Sed et erat faucibus nunc euismod ultricies
    ut id justo. Nullam cursus suscipit nisi, et ultrices justo sodales nec.
    Fusce venenatis facilisis lectus ac semper. Aliquam at massa ipsum.
    Quisque bibendum purus convallis nulla ultrices ultricies. Nullam
    aliquam, mi eu aliquam tincidunt, purus velit laoreet tortor, viverra
    pretium nisi quam vitae mi. Fusce vel volutpat elit. Nam sagittis nisi dui.
    """

    @interpolated_content = "This is interpolated content, and is being sent by {{sender.name}}, of {{sender.address}}"

    @beneficiaries = [
      {
        'name' => 'Jane Doe',
        'address' => '1/3 30 Handel Pl, New Gorbals Glasgow',
        'postcode' => 'G50TP',
        'telephone' => '07772494030',
        'relationship' => 'partner',
        'age_to_inherit' => '60',
        'second_death' => false,
        'items' => "my car, house, and vinyl collection"
      },
      {
        'name' => 'John Doe',
        'address' => '1/3 30 Handel Pl, New Gorbals Glasgow',
        'postcode' => 'G50TP',
        'telephone' => '07772494030',
        'relationship' => 'advisor',
        'age_to_inherit' => '18',
        'second_death' => true,
        'items' => "my car, house, and vinyl collection"
      }
    ]

    render 'document_templates/example_document'
  end

end