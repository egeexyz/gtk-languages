using Gtk;

class ElementaryFileViewer : Window {

	private TextView _textView;

	public ElementaryFileViewer() {
		var header = new HeaderBar ();
    
		header.Title = "ElementaryOS";
		header.Subtitle = "An ElementaryOS App";
		header.ShowCloseButton = true;
		header.Spacing = 0;

		WindowPosition = WindowPosition.Center;
		Titlebar = header;
		SetDefaultSize (500, 600);
		BorderWidth = 2;

		var openIcon = new Image ("document-open", IconSize.SmallToolbar);
		var openButton = new ToolButton (openIcon, "Open");
		openButton.IsImportant = true;
		//openButton.Clicked
		header.Add(openButton);

		_textView = new TextView ();
		_textView.Editable = false;
		_textView.CursorVisible = false;

		var scroll = new ScrolledWindow (null, null);
		scroll.SetPolicy (AutoStartupNotification, PolicyType.Automatic);
		scroll.Add (_textView);

		var vbox = new Box (Orientation.Vertical, 0);
		vbox.PackStart (scroll, true, true, 0);
		Add (vbox);
	}

	public static int Main (string[] args)
	{
		Gtk.Init (ref args);

		var window = new ElementaryFileViewer ();
		window.DeleteEvent (Gtk.Main.Quit);
		window.ShowAll ();

		Gtk.Main ();
		return 0;
	}
}
