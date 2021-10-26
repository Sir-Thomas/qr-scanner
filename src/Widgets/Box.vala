public class QrScanner.Box : Gtk.Box {
    construct {
        var image = new Gtk.Image.from_file ("../../data/placeholder.png");
        append (image);
    }
}