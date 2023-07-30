;;; $DOOMDIR/config.el
;; -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Transparency enabled
;; Doesn't quite work with wayland but I guess we have to wait for emacs 29
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

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
(setq doom-font (font-spec :family "JetBrains Mono Nerd Font" :size 17 :weight 'normal))
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
(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/docs/org"
        org-agenda-files '("~/docs/org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ⏷ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◈" "◆" "◇" "●" "○" "◈" "◆" "◇")
        org-superstar-item-bullet-alist '((?+ . ?↠) (?- . ?⟶)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("searx" . "http://www.searx.tiekoetter.com/search?q=") ; Choose a public instance for faster search results.
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-todo-keywords   ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"      ; A task that is ready to be tackled
             "CURRENT(c)"   ; Current task
             "QUEUE(q)"     ; Queue upcoming task
             "|"            ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"      ; Task has been completed
             "SUBMITTED(s)" ; A project that contains other tasks
             ))
        ;; org-todo-keyword-faces
        ;;   '(
        ;;     ("TODO" . (:foreground (catppuccin-get-color 'red 'mocha) :weight bold))
        ;;     ("CURRENT" . (:foreground (catppuccin-get-color 'blue 'mocha) :weight bold))
        ;;     ("QUEUE" . (:foreground (catppuccin-get-color 'blue 'mocha) :weight bold))
        ;;     ("DONE" . (:foreground (catppuccin-get-color 'blue 'mocha) :weight bold))
        ;;     ("SUBMITTED" . (:foreground (catppuccin-get-color 'blue 'mocha) :weight bold))
        ;;     )
        org-agenda-block-separator 9472
        org-agenda-custom-commands
          '(("w" "Agenda Work view"
             (
              (todo "CURRENT" ((org-agenda-overriding-header "Current Task")))
              (todo "QUEUE" ((org-agenda-overriding-header "In Queue")))
              (todo "TODO" ((org-agenda-overriding-header "To-do task")))
              (todo "DONE" ((org-agenda-overriding-header "Completed Task")))
              (agenda "")
              (alltodo "")
              )
           ))
        )
)
;; (custom-set-faces
;;  '(org-agenda-todo ((t :foreground (catppuccin-get-color 'blue) :weight bold)))
;; )
;; Workman layout for emacs
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

;; Adjusting the home rome keys for a more comfortable experience using workman layout with avy
(setq avy-keys '(?a ?s ?h ?t ?g ?y ?n ?e ?o ?i))
(setq avy-all-windows t)
(setq avy-timeout-seconds 1)

(load-theme 'catppuccin t)
