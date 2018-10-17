const Gtk = imports.gi.Gtk;

Gtk.init(null, null);

const header = new Gtk.HeaderBar();
header.set_title("GJS");
header.set_subtitle("An app made with GJS");
header.set_show_close_button(true);

const window = new Gtk.Window();
window.window_position = Gtk.WindowPosition.CENTER;
window.connect('destroy', Gtk.main_quit);
window.set_default_size(350, 70);
window.set_titlebar(header);
window.border_width = 10;

window.add(new Gtk.Button({ label: "Hello GJS" }));
window.show_all ();

Gtk.main();

