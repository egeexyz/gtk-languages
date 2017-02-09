using Gtk;

TextView text_view;
Window window;

int main(string[] args) {
  init(ref args);

  var header = new HeaderBar();
  header.set_title("ElementaryOS");
  header.set_subtitle("An app for ElementaryOS");
  header.set_show_close_button(true);

  window = new Window();
  window.window_position = WindowPosition.CENTER;
  window.destroy.connect(main_quit);
  window.set_default_size (500, 600);
  window.set_titlebar(header);
  window.border_width = 2;

  var open_icon = new Gtk.Image.from_icon_name("document-open", IconSize.SMALL_TOOLBAR);
  var open_button = new Gtk.ToolButton(open_icon, "Open");
  open_button.is_important = true;
  header.add(open_button);
  open_button.clicked.connect(on_open_clicked);

  text_view = new TextView ();
  text_view.editable = false;
  text_view.cursor_visible = false;

  var scroll = new ScrolledWindow (null, null);
  scroll.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
  scroll.add (text_view);

  var vbox = new Box (Orientation.VERTICAL, 0);
  vbox.pack_start (scroll, true, true, 0);
  window.add (vbox);

  window.destroy.connect (Gtk.main_quit);
  window.show_all ();

  window..??????

  Gtk.main();
  return 0;
}

void on_open_clicked () {
  var file_chooser = new FileChooserDialog (
                                "Open File",
                                window,
                                FileChooserAction.OPEN,
                                "_Cancel", ResponseType.CANCEL,
                                "_Open", ResponseType.ACCEPT);
  if (file_chooser.run () == ResponseType.ACCEPT) {
    open_file (file_chooser.get_filename ());
  }
  file_chooser.destroy ();
}

void open_file (string filename) {
  try {
    string text;
    FileUtils.get_contents (filename, out text);
    text_view.buffer.text = text;
  } catch (Error e) {
    stderr.printf ("Error: %s\n", e.message);
  }
}
