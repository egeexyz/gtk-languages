init
	Gtk.init(ref args)
	var header = new Gtk.HeaderBar()
	header.set_title("ElementaryOS")
	header.set_subtitle("An app for ElementaryOS")
	header.set_show_close_button(true)

	var window = new Gtk.Window()
	window.window_position = Gtk.WindowPosition.CENTER
	window.destroy.connect (Gtk.main_quit)
	window.set_default_size(350, 70)
	window.set_titlebar(header)
	window.border_width = 10

	window.add(new Gtk.Button.with_label("Hello Genie"))

	window.show_all()
	Gtk.main()
