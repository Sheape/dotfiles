;;; $DOOMDIR/config.el
;; -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

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
(setq doom-font (font-spec :family "Iosevka SS14 Extended" :size 17 :weight 'normal))
;;(setq doom-font "Iosevka SS14 Extended")
;; Iosevka SS14 extended
;; Line Spacing
(setq default-text-properties '(line-spacing 0.15 line-height 1.05))

;; BUG: Watch for fix
;; Solving the issue for huge performance lost on emacs 27.
;;(add-load-path! "$HOME/.doom.d/packages/")
;;(require 'persistent-soft)


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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
  (setq org-directory "/hdd/Work/org"
        org-agenda-files '("/hdd/Work/org/agenda.org")
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
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

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

;; Org-trello
(require 'org-trello)

;; Bitlbee ForkDaemon
(defun facebook-connect ()
  "Connect to IM networks using bitlbee."
  (interactive)
  (erc :server "localhost" :port 6667 :nick "user"))
