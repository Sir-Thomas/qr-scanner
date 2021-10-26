public class QrScanner.Box : Gtk.Box {
    construct {
        orientation = Gtk.Orientation.VERTICAL;

        var image = new Gtk.Image.from_file ("../../data/placeholder.png");
        image.vexpand = true;
        append (image);
        
        var button = new Gtk.Button.with_label ("Scan QR Code") {
            margin_top = 10,
            margin_bottom = 10,
            margin_start = 10,
            margin_end = 10
        };
        append (button);
    }
}