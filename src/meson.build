
i18n = import('i18n')
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

executable(
    meson.project_name(),
    'Application.vala',
    'Widgets' / 'Box.vala',
    'Widgets' / 'Window.vala',
    dependencies: [
        dependency('gtk4')
    ],
    install: true
)

i18n.merge_file(
    input: '..' / 'data' / 'qr-scanner.desktop.in',
    output: meson.project_name() + '.desktop',
    po_dir: meson.source_root() / 'po',
    type: 'desktop',
    install: true,
    install_dir: get_option('datadir') / 'applications'
)

i18n.merge_file(
    input: '..' / 'data' / 'qr-scanner.appdata.xml.in',
    output: meson.project_name() + '.appdata.xml',
    po_dir: meson.source_root() / 'po',
    install: true,
    install_dir: get_option('datadir') / 'metainfo'
)
