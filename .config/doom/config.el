;;; $DOOMDIR/config.el
;; -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Transparency enabled
;; Doesn't quite work with wayland but I guess we have to wait for emacs 29
;; Uncomment the following lines if you want transparency in X11
;; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))

;; Colorscheme
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; BUG: Doesn't work for some reason --https://github.com/hlissner/doom-emacs/issues/5686
(setq doom-font (font-spec :family "JetBrains Mono Nerd Font Propo" :size 17 :weight 'normal))
;;(setq doom-font "Iosevka SS14 Extended")
;; Iosevka SS14 extended
;; Line Spacing
(setq default-text-properties '(line-spacing 0.15 line-height 1.05))

;; BUG: Watch for fix
;; Solving the issue for huge performance lost on emacs 27.
;;(add-load-path! "$HOME/.doom.d/packages/")
;;(require 'persistent-soft)


;; Relative line number
(setq display-line-numbers-type 'relative)

;; Prevent new lines from creating comments
(setq comment-empty-lines nil)

;; Sign columns
;; (require 'fill-column-indicator)
;; (setq-default fill-column 80)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; Org-mode, org-roam, org-babel, org-journal configuration
(load-theme 'catppuccin t)
(custom-set-faces `(bold ((t (:weight bold :foreground ,(catppuccin-get-color 'mauve)))))
                  `(italic ((t (:family "Cartograph CF" :slant italic :foreground ,(catppuccin-get-color 'peach)))))
                  `(underline ((t (:underline (:style line :color ,(catppuccin-get-color 'maroon)) :foreground ,(catppuccin-get-color 'maroon)))))
)

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/docs/org"
        org-roam-directory "~/docs/org/roam/grade-12"
        org-agenda-files '("~/docs/org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-roam-completion-everywhere t
        org-ellipsis " ⏷ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◈" "◆" "◇" "●" "○" "◈" "◆" "◇")
        org-superstar-item-bullet-alist '((?+ . ?↠) (?- . ?⟶)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-startup-folded 'show2levels
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("searx" . "http://www.searx.tiekoetter.com/search?q=") ; Choose a public instance for faster search results.
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-todo-keywords   ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"        ; A task that is ready to be tackled
             "ALMOST DONE(a)" ; Almost Done
             "CURRENT(c)"     ; Current task
             "QUEUE(q)"       ; Queue upcoming task
             "|"              ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"        ; Task has been completed
             "SUBMITTED(s)"   ; A project that contains other tasks
             ))
        org-todo-keyword-faces
          `(
            ("TODO" . ((t (:foreground ,(catppuccin-get-color 'blue ) :weight bold))))
            ("ALMOST DONE" . ((t (:foreground ,(catppuccin-get-color 'peach ) :weight bold))))
            ("CURRENT" . ((t (:foreground ,(catppuccin-get-color 'red ) :weight bold))))
            ("QUEUE" . ((t (:foreground ,(catppuccin-get-color 'lavender ) :weight bold))))
            ("DONE" . ((t (:foreground ,(catppuccin-get-color 'green ) :weight bold))))
            ("SUBMITTED" . ((t (:foreground ,(catppuccin-get-color 'mauve ) :weight bold))))
            )
        org-agenda-block-separator 9472
        org-agenda-custom-commands
          '(("w" "Agenda Work view"
             (
              (todo "CURRENT" ((org-agenda-overriding-header "Current Task")))
              (todo "QUEUE" ((org-agenda-overriding-header "In Queue")))
              (todo "TODO" ((org-agenda-overriding-header "To-do task")))
              (todo "ALMOST DONE" ((org-agenda-overriding-header "Almost done")))
              (todo "DONE" ((org-agenda-overriding-header "Completed Task")))
              (agenda "")
              (alltodo "")
              )
           ))
        )
  (add-hook 'org-pomodoro-finished-hook #'custom/notify-pomodoro-finish)
  (custom-set-faces
        `(org-document-title ((t (:family "Cartograph CF" :height 1.5 :slant italic :weight bold :foreground ,(catppuccin-get-color 'mauve)))))
        `(org-level-1 ((t (:family "Cartograph CF" :height 1.4 :slant italic :weight bold :foreground ,(catppuccin-get-color 'red)))))
        `(org-level-2 ((t (:family "Cartograph CF" :height 1.3 :slant italic :weight bold :foreground ,(catppuccin-get-color 'maroon)))))
        `(org-level-3 ((t (:family "Cartograph CF" :height 1.2 :slant italic :weight bold :foreground ,(catppuccin-get-color 'pink)))))
        `(org-level-4 ((t (:family "Cartograph CF" :height 1.1 :slant italic :weight bold :foreground ,(catppuccin-get-color 'blue)))))
        `(org-level-5 ((t (:family "Cartograph CF" :slant italic :weight normal :foreground ,(catppuccin-get-color 'sapphire)))))
        `(org-level-6 ((t (:family "Cartograph CF" :slant italic :weight normal :foreground ,(catppuccin-get-color 'lavender)))))
        `(org-level-7 ((t (:family "Cartograph CF" :slant italic :weight normal :foreground ,(catppuccin-get-color 'sky)))))
        `(org-level-8 ((t (:family "Cartograph CF" :slant italic :weight normal :foreground ,(catppuccin-get-color 'flamingo)))))
        `(org-drawer ((t (:foreground ,(catppuccin-get-color 'overlay0)))))
        `(org-hide ((t (:background ,(catppuccin-get-color 'base ) :foreground ,(catppuccin-get-color 'base)))))
   )
)
;; (custom-set-faces
;;  '(org-agenda-todo ((t :foreground (catppuccin-get-color 'blue) :weight bold)))
;; )

;; Workman layout for emacs
(after! evil
  (define-key evil-motion-state-map "n" 'evil-next-line)
  (define-key evil-motion-state-map "N" 'evil-join)
  (define-key evil-motion-state-map "e" 'evil-previous-line)
  (define-key evil-motion-state-map "E" 'evil-lookup)
  (define-key evil-motion-state-map "gn" 'evil-next-visual-line)
  (define-key evil-motion-state-map "ge" 'evil-previous-visual-line)
  (define-key evil-normal-state-map "o" 'evil-forward-char)
  (define-key evil-motion-state-map "O" 'evil-window-bottom)
  (define-key evil-motion-state-map "zo" 'evil-scroll-column-right)
  (define-key evil-motion-state-map "zO" 'evil-scroll-right)
  (define-key evil-motion-state-map "k" 'evil-next-match)
  (define-key evil-motion-state-map "K" 'evil-previous-match)
  (define-key evil-motion-state-map "gk" 'evil-next-match)
  (define-key evil-motion-state-map "gK" 'evil-previous-match)
  (define-key evil-normal-state-map "y" 'evil-backward-char)
  (define-key evil-motion-state-map "Y" 'evil-window-top)
  (define-key evil-motion-state-map "zY" 'evil-scroll-left)
  (define-key evil-window-map (kbd "SPC w Y") 'evil/window-move-left)
  (define-key evil-normal-state-map "l" 'evil-open-below)
  (define-key evil-normal-state-map "L" 'evil-open-above)
  (define-key evil-motion-state-map (kbd "C-l") 'evil-jump-backward)
  (define-key evil-normal-state-map "j" 'evil-yank)
  (define-key evil-normal-state-map "J" 'evil-yank-line)
  (define-key evil-normal-state-map "r" 'evil-change)
  (define-key evil-normal-state-map "R" 'evil-change-line)
  (define-key evil-normal-state-map "m" 'evil-replace)
  (define-key evil-normal-state-map "M" 'evil-replace-state)
  (define-key evil-visual-state-map "l" 'evil-replace-state)
  (define-key evil-window-map (kbd "SPC w Y") 'evil/window-move-left)
)

;; Org-pomodoro-third-time keybindings
(defun custom/notify-pomodoro-finish ()
  (start-process-shell-command "org-pomodoro-notify" nil "notify-send 'Pomodoro Finished!' 'Take a break!'")
)
(org-pomodoro-third-time-mode)
(defun custom/set-pomodoro-ratio (ratio)
  "Set the `org-pomodoro-third-time-break-to-work-ratio' variable to RATIO."
  (setq org-pomodoro-third-time-break-to-work-ratio ratio)
  (message "Pomodoro break-to-work ratio set to %s" ratio))
(defun custom/set-pomodoro-length ()
  "Prompt the user to set the value of `org-pomodoro-length' variable."
  (interactive)
  (setq org-pomodoro-length (read-number "Enter the pomodoro length (in minutes): "))
  (message "Pomodoro length set to %s" org-pomodoro-length))
(map! :after org
      :localleader
      :map org-mode-map
      :prefix ("z" . "org-pomodoro")

      :desc "Start pomodoro timer" "s"             #'org-pomodoro
      :desc "End timer now/break early" "n"        #'org-pomodoro-third-time-end-now
      :desc "End timer in" "i"                     #'org-pomodoro-third-time-end-in
      :desc "End timer at" "a"                     #'org-pomodoro-third-time-end-at
      :desc "Take a long break" "b"                #'org-pomodoro-third-time-long-break
      :desc "Set the length of pomodoro timer" "t" #'custom/set-pomodoro-length

      (
       :prefix ("r" . "Change work/break ratio")
        :desc "Grinding (1/6)" "g" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 6.0)))
        :desc "Hard (1/5)" "h" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 5.0)))
        :desc "Industrious (1/4)" "i" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 4.0)))
        :desc "Standard (1/3)" "s" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 3.0)))
        :desc "Lazy (1/2)" "l" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 2.0)))
      )
)
(map! :after org
      :localleader
      :map org-agenda-mode-map
      :prefix ("z" . "org-pomodoro")

      :desc "Start pomodoro timer" "s"             #'org-pomodoro
      :desc "End timer now/break early" "n"        #'org-pomodoro-third-time-end-now
      :desc "End timer in" "i"                     #'org-pomodoro-third-time-end-in
      :desc "End timer at" "a"                     #'org-pomodoro-third-time-end-at
      :desc "Take a long break" "b"                #'org-pomodoro-third-time-long-break
      :desc "Set the length of pomodoro timer" "t" #'custom/set-pomodoro-length

      (
       :prefix ("r" . "Change work/break ratio")
        :desc "Grinding (1/6)" "g" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 6.0)))
        :desc "Hard (1/5)" "h" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 5.0)))
        :desc "Industrious (1/4)" "i" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 4.0)))
        :desc "Standard (1/3)" "s" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 3.0)))
        :desc "Lazy (1/2)" "l" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 2.0)))
      )
)

;; Org-roam-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
;; Latex configuration
;; Org-fragtog
(add-hook 'org-mode-hook 'org-fragtog-mode)

;; Latex
(after! tex
  (setq TeX-engine 'luatex))

;; Typst
(require 'typst-mode)

;; Adjusting the home row keys for a more comfortable experience using workman layout with avy
(setq avy-keys '(?a ?s ?h ?t ?g ?y ?n ?e ?o ?i))
(setq avy-all-windows t)
(setq avy-timeout-seconds 1)

