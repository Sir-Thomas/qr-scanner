namespace QrGrid {
    public class QrGrid : Gtk.Grid {
        public QrGrid () {
            var hello_button = new Gtk.Button.with_label (_("Click me!"));
            var hello_label = new Gtk.Label (null);
            var rotate_button = new Gtk.Button.with_label (_("Rotate"));
            var rotate_label = new Gtk.Label (_("Horizontal"));

            var grid = new Gtk.Grid () {
                row_spacing = 6,
                column_spacing = 6
            };

            this.attach (hello_button, 0, 0);
            this.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);

            this.attach (rotate_button, 0, 1);
            this.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

            hello_button.clicked.connect (() => {
                hello_label.label = _("Hello World!");
                hello_button.sensitive = false;
            });

            rotate_button.clicked.connect (() => {
                rotate_label.angle = 90;
                rotate_label.label = _("Vertical");
                rotate_button.sensitive = false;
            });
        }
    }
}