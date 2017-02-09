// This is Vala Code!

using Gtk;

class ElementaryFileViewer : Window {
  TextView text_view;

  ElementaryFileViewer () {
    var header = new HeaderBar ();
    header.title = "ElementaryOS";
    header.show_close_button = true;
    header.subtitle = "An ElementaryOS App";
    header.spacing = 0;

    window_position = WindowPosition.CENTER;
    set_titlebar(header);
    set_default_size (500, 600);
    border_width = 2;

    var open_icon = new Image.from_icon_name ("document-open", IconSize.SMALL_TOOLBAR); // Explicit Typing
    var open_button = new ToolButton (open_icon, "Open");
    open_button.is_important = true;
    open_button.clicked.connect (on_open_clicked);
    header.add (open_button);

    text_view = new TextView ();
    text_view.editable = false;
    text_view.cursor_visible = false;

    var scroll = new ScrolledWindow (null, null);
    scroll.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
    scroll.add (text_view);

    var vbox = new Box (Orientation.VERTICAL, 0);
    vbox.pack_start (scroll, true, true, 0);
    add (vbox);
  }

  void on_open_clicked () {
    var file_chooser = new FileChooserDialog ("Open File", this,
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
      this.text_view.buffer.text = text;
    } catch (Error e) {
      stderr.printf ("Error: %s\n", e.message);
    }
  }

  static int main (string[] args) {
    init (ref args);

    var window = new ElementaryFileViewer ();
    window.destroy.connect (main_quit);
    window.show_all ();

    Gtk.main ();
    return 0;
  }
}
