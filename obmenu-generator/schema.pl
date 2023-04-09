#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    {sep => 'QUICK MENU'},

    #          COMMAND                 LABEL              ICON
    {item => ['alacritty',        'Terminal',     'utilities-terminal']},
    {item => ['xdg-open .',       'File Manager', 'system-file-manager']},
    {item => ['xdg-open http://', 'Web Browser',  'web-browser']},
    #{item => ['gmrun',            'Run command',  'system-run']},

    {sep => undef},
    {item => ['scrot -s ~/Pictures/%b%d_%H%M%S.png -e "xclip -selection clipboard -t image/png -i $f"',          'Full ScreenShot', 'applications-engineering']},
    {item => ['scrot --select -s ~/Pictures/%b%d_%H%M%S.png -e "xclip -selection clipboard -t image/png -i $f"', 'Grep ScreenShot', 'applications-engineering']},

    {sep => 'System'},
    {item => ['openbox --reconfigure', 'Refresh Openbox', 'openbox']},
    {item => ["sh -c 'killall tint2 ; tint2 && killall plank ; plank && nitrogen --force-setter=xinerama --restore'",
              "Refresh Display", "applications-engineering"]},


    #### =========================
    #       Replaced by jgmenu
    # ----------------------------
    ##          NAME            LABEL                ICON
    #{cat => ['utility',     'Accessories', 'applications-utilities']},
    #{cat => ['development', 'Development', 'applications-development']},
    #{cat => ['education',   'Education',   'applications-science']},
    #{cat => ['game',        'Games',       'applications-games']},
    #{cat => ['graphics',    'Graphics',    'applications-graphics']},
    #{cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    #{cat => ['network',     'Network',     'applications-internet']},
    #
    #{beg => ['Office',                     'applications-office']}, # Custom Apps error fixed
    #  {item => ['/bin/bash -c "LANGUAGE=ko_KR /opt/hnc/hoffice11/Bin/hcl"', '한셀 2022', 'accessories-text-editor']},
    #  {item => ['/bin/bash -c "LANGUAGE=ko_KR /opt/hnc/hoffice11/Bin/hword"', '한워드 2022', 'accessories-text-editor']},
    #  {item => ['/bin/bash -c "LANGUAGE=ko_KR /opt/hnc/hoffice11/Bin/hwp"', '한글 2022', 'accessories-text-editor']},
    #  {item => ['/bin/bash -c "LANGUAGE=ko_KR /opt/hnc/hoffice11/Bin/hsl"', '한쇼 2022', 'accessories-text-editor']},
    #  {item => ['xournalpp', 'Xournal++',  'accessories-text-editor']},
    #  {cat => ['office',     '.',          'applications-office']},
		#{end => undef},
    #
    #{cat => ['other',       'Other',       'applications-other']},
    #{cat => ['system',      'System Apps', 'applications-system']},
    #{cat => ['settings',    'Settings',    'applications-accessories']},
    #
    ##             LABEL          ICON
    ##{beg => ['My category',  'cat-icon']},
    ##          ... some items ...
    ##{end => undef},
    #
    ##            COMMAND     LABEL        ICON
    ##{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},
    #
    ### Generic advanced settings
    ##{sep       => undef},
    ##{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    ##{sep       => undef},
    #
    ### Custom advanced settings
    #{sep => undef},
    #{beg => ['Advanced Settings', 'applications-engineering']},
    #
    #  # Configuration files
    #  {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
    #  {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-generic']},
    #
    #  # obmenu-generator category
    #  {beg => ['Obmenu-Generator', 'accessories-text-editor']},
    #    {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
    #    {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},
    #
    #    {sep  => undef},
    #    {item => ['obmenu-generator -s -c',    'Generate a static menu',             'accessories-text-editor']},
    #    {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons',  'accessories-text-editor']},
    #    {sep  => undef},
    #    {item => ['obmenu-generator -p',       'Generate a dynamic menu',            'accessories-text-editor']},
    #    {item => ['obmenu-generator -p -i',    'Generate a dynamic menu with icons', 'accessories-text-editor']},
    #    {sep  => undef},
    #
    #    {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
    #  {end => undef},
    #
    #  # Openbox category
    #  {beg => ['Openbox', 'openbox']},
    #    {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'text-x-generic']},
    #    {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
    #    {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-x-generic']},
    #    {item => ['openbox --reconfigure',               'Reconfigure Openbox', 'openbox']},
    #  {end => undef},
    #{end => undef},
    #
    ### The xrandr automake command
    #{beg => ['Monitor Settings', 'applications-engineering']},
    #  {item => ["sh -c 'killall tint2 ; tint2 && killall plank ; plank && nitrogen --force-setter=xinerama --restore'",
    #            "Refresh", "applications-engineering"]},
    #  {sep => undef},
    #  {item => ["$ENV{HOME}/.config/openbox/scripts/save_randr.py", "Save Settings", "applications-engineering"]},
    #  {pipe => ["$ENV{HOME}/.config/openbox/scripts/ob_randr.py", "Monitor", "applications-engineering"]},
    #{end => undef},
    #
    #{sep => undef},
    #
    #{sep => 'System'},
    #
    ### The xscreensaver lock command
    ##{item => ['xscreensaver-command -lock', 'Lock', 'system-lock-screen']},
    #
    ### This option uses the default Openbox's "Exit" action
    #{exit => ['Logout', 'system-lock-screen']},
    #
    ### This option uses the default Openbox's "Exit" action
    #{item => ["$ENV{HOME}/.config/openbox/scripts/shutdown.py", 'Shutdown', 'application-exit']},
    #
    ### This uses the 'oblogout' menu
    ## {item => ['oblogout', 'Exit', 'application-exit']},
]
