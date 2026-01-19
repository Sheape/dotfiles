export def get_keybindings [] {
    [
        {
            name: workman_up
            modifier: none
            keycode: char_e
            mode: vi_normal
            event: {
                send: Up
            }
        },
        {
            name: workman_down
            modifier: none
            keycode: char_n
            mode: vi_normal
            event: {
                send: Down
            }
        },
        {
            name: workman_left
            modifier: none
            keycode: char_y
            mode: vi_normal
            event: {
                send: Left
            }
        },
        {
            name: workman_right
            modifier: none
            keycode: char_o
            mode: vi_normal
            event: {
                send: Right
            }
        },
        {
            name: yazicd
            modifier: control
            keycode: char_l
            mode: vi_insert
            event: {
                send: ExecuteHostCommand
                cmd: "yazicd"
            }
        }
        {
            name: yazicd
            modifier: control
            keycode: char_j
            mode: vi_normal
            event: {
                edit: InsertNewline
            }
        }
    ]
}
