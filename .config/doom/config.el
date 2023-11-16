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
(setq user-full-name "Paul Gerald D. Pare"
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

(setq scroll-margin 8)

;; Relative line number
(setq display-line-numbers-type 'relative)

;; Prevent new lines from creating comments
(setq +evil-want-o/O-to-continue-comments nil)

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
                  `(underline ((t (:underline (:style line :color ,(catppuccin-get-color 'green)) :foreground ,(catppuccin-get-color 'green)))))
)

(add-hook 'text-mode-hook #'turn-on-auto-fill)
(setq visual-fill-column-width 80)
(setq-default fill-column 80)
;; (global-visual-fill-column-mode t)

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  ;; Directories
  (setq
   org-directory "~/docs/org"
   org-roam-directory "~/docs/org/roam/grade-12"
   org-fc-directories '("~/docs/org/flashcards")
   ;; Files
   org-agenda-files '("~/docs/org/roam/personal/daily/agenda.org" "~/docs/org/roam/personal/today.org")
   org-default-notes-file (expand-file-name "notes.org" org-directory)
   org-roam-completion-everywhere t
   org-ellipsis " ⏷ "
   org-pretty-entities t
   org-superstar-headline-bullets-list '("◉" "●" "○" "◈" "◆" "◇" "●" "○" "◈" "◆" "◇")
   org-superstar-item-bullet-alist '((?+ . ?↠) (?- . ?⟶)) ; changes +/- symbols in item lists
   org-hide-emphasis-markers t
   org-hide-leading-stars t
   org-indent-mode-turns-on-hiding-stars t
   org-auto-align-tags nil
   org-tags-column 0
   org-insert-heading-respect-content t
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "󰥔 now ─────────────────────────────────────────────────"
   ;; org-modern-hide-stars " "
   org-log-done 'time
   org-startup-with-inline-images t
   org-image-actual-width 200
   org-startup-folded 'show2levels
   org-export-with-smart-quotes nil     ;; Dont use especial chars for '

   ;; ex. of org-link-abbrev-alist in action
   ;; [[arch-wiki:Name_of_Page][Description]]
   org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
   '(("searx" . "http://www.searx.tiekoetter.com/search?q=") ; Choose a public instance for faster search results.
     ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
     ("wiki" . "https://en.wikipedia.org/wiki/"))
   org-todo-keywords   ; This overwrites the default Doom org-todo-keywords
   '((sequence
      "TODO(t)"        ; A task that is ready to be tackled
      "REMINDERS(r)"   ; Reminders
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
     ("REMINDERS" . ((t (:foreground ,(catppuccin-get-color 'sky ) :weight bold))))
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
       (todo "REMINDERS" ((org-agenda-overriding-header "Reminders")))
       (todo "CURRENT" ((org-agenda-overriding-header "Current Task")))
       (todo "QUEUE" ((org-agenda-overriding-header "In Queue")))
       (todo "TODO" ((org-agenda-overriding-header "To-do task")))
       (todo "ALMOST DONE" ((org-agenda-overriding-header "Almost done")))
       (todo "DONE" ((org-agenda-overriding-header "Completed Task")))
       (agenda "")
       (alltodo "")
       )
      ))
   org-capture-templates
   '(("t" "Task" entry (file+headline "~/docs/org/roam/personal/today.org" "Tasks")
      "* CURRENT %? %^G\n%^{BUDGET_TODAY}p "
      :empty-lines 0
      )
     )
   )
  (defun stag-misanthropic-capture (&rest r)
    (delete-other-windows))

  ;; Uncomment if you want org-capture to take over the buffer
  ;; (advice-add  #'org-capture-place-template :after 'stag-misanthropic-capture)
  (defun custom/org-capture-close-frame () (delete-frame))
  (defun custom/save-all-org () (org-save-all-org-buffers))
  (add-hook 'org-pomodoro-finished-hook #'custom/notify-pomodoro-finish)
  (add-hook 'org-pomodoro-finished-hook #'custom/save-all-org)
  (add-hook 'org-pomodoro-started-hook #'custom/save-all-org)
  (add-hook 'org-mode-hook
            (lambda ()
              (set-face-attribute 'org-indent nil
                                  :inherit '(org-hide fixed-pitch))
              (set-face-attribute 'org-hide nil
                                  :inherit 'fixed-pitch)))
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
   ;; `(org-drawer ((t (:foreground ,(catppuccin-get-color 'overlay0))))) Disabled for now cuz its causing some issues with cache.
   ;; `(org-hide ((t (:background nil :foreground nil))))
   )
  (require 'org-clock-budget)
  (after! org-clock-budget
    (setq org-clock-budget-daily-budgetable-hours 8)
    (defun org-clock-budget-interval-today ()
      (cons
       (format-time-string "%Y-%m-%d 00:00:00")
       (format-time-string "%Y-%m-%d 23:59:59")))

    (setq org-clock-budget-intervals
          '(("BUDGET_TODAY" org-clock-budget-interval-today)
            ("BUDGET_WEEK" org-clock-budget-interval-this-week)
            ("BUDGET_MONTH" org-clock-budget-interval-this-month)
            ))
    )
  ;; fix color handling in org-preview-latex-fragment
  (require 'org-src)
  (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t :background nil)))
  ;; (plist-put org-format-latex-options :background "transparent")
  (let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
    (plist-put dvipng--plist :use-xcolor t)
    (plist-put dvipng--plist :image-converter '("dvipng -D %D -bg transparent -T tight -o %O %f")))

  ;; (global-org-modern-mode)

)
(defun my-insert-input ()
  "Insert the current input in Vertico."
  (interactive)
  (if vertico--input
      (vertico-exit)
    (vertico-insert)))

(map! :map vertico-map
      :desc "bruh" "C-<return>" #'vertico-exit-input)

;; Org capture
(defun custom/get-commit-msg ()
  (interactive)
  ;; (message "%s" (cadar (org-collect-keywords '("GIT_COMMIT_MSG"))))
  (let ((commit_msg (cadar (org-collect-keywords '("GIT_COMMIT_MSG"))))
        )
    (if (not commit_msg)
        (message "GIT_COMMIT_MSG not found. Commit your file manually.")
        (shell-command (format "git commit -m \"%s\"" commit_msg))))
)

(defun custom/set-image-size ()
  (interactive)
  (let ((pixels (read-number "How many pixels: ")))
    (setq org-image-actual-width pixels)
    (org-redisplay-inline-images)
    (message "Set image width to %s" pixels)))

;; Org-roam capture templates
(after! org-roam
  ;; Automatically refile Agenda task
(defun custom/refile-agenda (void_args)
  "Refile today's heading to the proper heading in agenda file"
  (interactive)
  (let* ((case-fold-search t)
        (first-date (org-read-date nil nil "++Mon" nil (org-time-string-to-time (org-read-date nil nil "-7d"))))
        (second-date (org-read-date nil nil "--Sun" nil (org-time-string-to-time (org-read-date nil nil "+7d"))))
        (first-date-year (format-time-string "%Y" (org-time-string-to-time first-date)))
        (second-date-year (format-time-string "%Y" (org-time-string-to-time second-date)))
        (first-date-month (format-time-string "%B" (org-time-string-to-time first-date)))
        (second-date-month (format-time-string "%B" (org-time-string-to-time second-date)))
        (agenda-file (expand-file-name (concat second-date-year ".org") org-directory))
        (hierarchy-headers (list first-date-month))
        )
    (if (not (string-equal first-date-year second-date-year))
        (funcall (lambda ()
                   (write-region "" nil agenda-file)
                   (message "New year is coming!! Created a new agenda file: %s" agenda-file)
        ))
        (funcall (lambda ()
          (if (string-equal first-date-month second-date-month)
              (push (concat first-date-month " "
                (format-time-string "%d" (org-time-string-to-time first-date))
                " - "
                (format-time-string "%d" (org-time-string-to-time second-date))
              ) hierarchy-headers)
            (push (concat first-date-month " "
                (format-time-string "%d" (org-time-string-to-time first-date))
                " - "
                second-date-month
                (format-time-string "%d" (org-time-string-to-time second-date))
                ) hierarchy-headers)
              )
          (push (format-time-string "%A") hierarchy-headers)
          (setq hierarchy-headers (reverse hierarchy-headers))
          (setq org-roam-capture--info `(
                :month-name ,(nth 0 hierarchy-headers)
                :week-interval ,(nth 1 hierarchy-headers)
                :day-name ,(nth 2 hierarchy-headers)))
        ))
)
)
  ""
  )

(defun custom/org-roam-copy-todo-to-today ()
  (interactive)
  (let* ((org-refile-keep nil) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
          '(("a" "tasks" entry "%?"
             :empty-lines 1
             :if-new (file+head+olp "agenda.org" "#+title: Agenda" ("${custom/refile-agenda}${month-name}" "${week-interval}" "${day-name}")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-delete-property "BUDGET_TODAY")
      (org-refile nil nil (list "Tasks" today-file nil pos))))
  (org-save-all-org-buffers)
)

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "DONE")
                 (custom/org-roam-copy-todo-to-today))))
;; End

  (map! :map org-roam-mode-map
        :leader
        :prefix ("n" . "notes")
        (
         :prefix ("r" . "roam")
         :desc "Commit notes"
         "c" #'custom/get-commit-msg
         ))

  (defun custom/capture-get-metadata (void_arg)
    (interactive)
    (let* ((subjects '(("Physics" . "Physics")
                       ("Biology" . "Biology")
                       ("Empowerment Technology" . "Emptech")
                       ("Philosophy" . "Philosophy")
                       ("Personal Development" . "Perdev")
                       ("HOPE" . "HOPE")
                       ("Practical Research 2" . "PR 2")
                       ("Media and Information Literacy" . "MIL")
                       ("Filipino" . "Filipino")))
           (subject-options (mapcar #'car subjects))
           (quarter (read-number "Quarter: "))
           (week (read-number "Week: "))
           (subject (completing-read "Subject: " subject-options))
           (subject-short (cdr (assoc subject subjects))))
      (setq org-roam-capture--info
            `(:quarter ,quarter
              :week ,week
              :subject ,subject
              :subject-short ,subject-short)))
    ""
    )
  (defun custom/subject-to-lower (void_arg)
    (let ((subject-lower (replace-regexp-in-string " " "_" (downcase (plist-get org-roam-capture--info :subject-short)))))
      (if (string-equal subject-lower "pr_2")
          "pr2"
          subject-lower
      )
    ))

  (defun custom/set-org-date-format ()
    (format-time-string "%B %e, %Y"))

  (setq org-roam-capture-templates
        '(
          ("d" "default" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)

          ("t" "topic" plain
           "\n* %?"
           :target (file+head "${custom/capture-get-metadata}${custom/subject-to-lower}/q${quarter}/w${week}/q${quarter}w${week}_${custom/subject-to-lower}_${slug}_main.org"
                              "#+title: ${title}
#+author: Paul Gerald D. Pare
#+date: %(custom/set-org-date-format)
#+GIT_COMMIT_MSG: Q${quarter}W${week}(${subject-short}): ${title}\n\n")
           :empty-lines-before 1
           :unnarrowed t
           )
          ("s" "definition" plain
           "\n\n\n* Definition\n%?"
           :target (file+head "${custom/capture-get-metadata}${custom/subject-to-lower}/q${quarter}/w${week}/q${quarter}w${week}_${custom/subject-to-lower}_${slug}.org"
                              "#+title: ${title}
#+author: Paul Gerald D. Pare
#+date: %(custom/set-org-date-format)\n\n")
           :empty-lines-before 1
           :unnarrowed t
           )
          ("p" "personal" plain
           "\n* Topic\n%?"
           :target (file+head "${slug}.org"
                              "#+title: ${title}
#+author: Paul Gerald D. Pare
#+date: %(custom/set-org-date-format)\n\n")
           :empty-lines-before 1
           :unnarrowed t
           )
          )
        )
)

(after! org-modern
  (setq org-modern-star '("◉" "●" "○" "◈" "◆" "◇" "●" "○" "◈" "◆" "◇"))
  (custom-set-faces
   ;; Org-modern
   `(org-modern-label ((t :height 0.8 :box (:color nil :line-width (0 . -3)))))
   `(org-modern-block-name ((t :weight bold)))
   `(org-modern-tag (
        (default :inherit (secondary-selection org-modern-label))
        (((background light)) :foreground "unspecified")
        (t :foreground ,(catppuccin-get-color 'text))))
   `(org-modern-done (
        (default :inherit org-modern-label)
        (((background light))
        :background ,(catppuccin-get-color 'green)
        :foreground ,(catppuccin-get-color 'subtext0))
        (t :background ,(catppuccin-get-color 'green)
        :foreground ,(catppuccin-get-color 'surface0))))
   )
)


;; Org Export
;; Markdown
;; (after! org-export
;;   (setq org-html-text-markup-alist
;;         (mapcar (lambda (pair)
;;                   (if (eq (car pair) 'underline)
;;                       (cons 'underline "<ins>%s</ins>")
;;                     pair))
;;                 org-html-text-markup-alist)))
(add-hook 'org-export-before-processing-functions 'custom-modify-html-markup-alist)

(defun custom-modify-html-markup-alist (backend)
  "Modify the underline markup in org-html-text-markup-alist."
  (when (eq backend 'md)
    (setq org-html-text-markup-alist
          (mapcar (lambda (pair)
                    (if (eq (car pair) 'underline)
                        (cons 'underline "<ins>%s</ins>")
                      pair))
                  org-html-text-markup-alist))))

;; (custom-set-faces
;;  '(org-agenda-todo ((t :foreground (catppuccin-get-color 'blue) :weight bold)))
;; )

;; Workman layout for emacs
(after! evil
  (unbind-key "l" evil-motion-state-map)
  (map! :map evil-motion-state-map
        "n" 'evil-next-line
        "N" 'evil-join
        "e" 'evil-previous-line
        "E" 'evil-lookup
        "gn" 'evil-next-visual-line
        "ge" 'evil-previous-visual-line
        "o" 'evil-forward-char
        "O" 'evil-window-bottom
        "zo" 'evil-scroll-column-right
        "zO" 'evil-scroll-right
        "y" 'evil-backward-char
        "k" 'evil-next-match
        "K" 'evil-previous-match
        "gk" 'evil-next-match
        "gK" 'evil-previous-match
        "j" 'evil-yank
        "J" 'evil-yank-line
        "," nil
        )

  (map! :after org
        :map evil-motion-state-map
        :nv "o" 'evil-forward-char)

  (map! :map evil-normal-state-map
        "o" 'evil-forward-char
        "y" 'evil-backward-char
        "Y" 'evil-window-top
        "zY" 'evil-scroll-left
        "l" 'evil-open-below
        "L" 'evil-open-above
        "j" 'evil-yank
        "J" 'evil-yank-line
        "r" 'evil-change
        "R" 'evil-change-line
        "m" 'evil-replace
        "M" 'evil-replace-state
        "n" 'evil-next-line
        "N" 'evil-join
        "e" 'evil-previous-line
        "E" 'evil-lookup
        "gn" 'evil-next-visual-line
        "ge" 'evil-previous-visual-line
        "o" 'evil-forward-char
        "O" 'evil-window-bottom
        "zo" 'evil-scroll-column-right
        "zO" 'evil-scroll-right
        "k" 'evil-next-match
        "K" 'evil-previous-match
        "gk" 'evil-next-match
        "gK" 'evil-previous-match)


  ;; (map! :map evil-motion-state-map
  ;;       (kbd "C-l") 'evil-jump-backward)

  (map! :map evil-window-map
        :leader
        :prefix "w"
        "y" #'evil-window-left
        "n" #'evil-window-down
        "e" #'evil-window-up
        "o" #'evil-window-right)
)
(map! :after org
      :map evil-org-mode-map
      :nv "o" #'evil-forward-char)

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
        :desc "Lazy (1/2)" "l" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 2.0)))
        :desc "Standard (1/3)" "s" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 3.0)))
        :desc "Industrious (1/4)" "i" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 4.0)))
        :desc "Hard (1/5)" "h" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 5.0)))
        :desc "Grinding (1/6)" "g" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 6.0)))
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
        :desc "Lazy (1/2)" "l" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 2.0)))
        :desc "Standard (1/3)" "s" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 3.0)))
        :desc "Industrious (1/4)" "i" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 4.0)))
        :desc "Hard (1/5)" "h" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 5.0)))
        :desc "Grinding (1/6)" "g" #'(lambda () (interactive) (custom/set-pomodoro-ratio (/ 1 6.0)))
      )
)

(map! :after org
      :localleader
      :map org-mode-map
      :prefix ("c" . "clock")

      :desc "org-clock-budget-report" "b" #'org-clock-budget-report
      :desc "org-analyzer-start" "a"      #'org-analyzer-start
      :desc "org-analyzer-stop" "A"       #'org-analyzer-stop
)

;; Org-anki
(setq flashcard-directory "~/docs/org/flashcards")
(defun custom/retrieve-parent-dirs ()
  (when buffer-file-name
    (let* ((file-path (file-name-directory buffer-file-name))
           (directory-names (split-string file-path "/" t)))
      (if (>= (length directory-names) 2)
          (list
                (nth (- (length directory-names) 3) directory-names)
                (nth (- (length directory-names) 2) directory-names)
                 (nth (- (length directory-names) 1) directory-names))
        nil))))

(setq lexical-binding t)
(require 'async-await)
(defun custom/refile-to-flashcard ()
  (interactive)
  (let* ((directories-list (custom/retrieve-parent-dirs))
         (parent-dirs (concat (expand-file-name flashcard-directory)
                              "/"
                              (nth 0 directories-list)
                              "/"
                              (nth 1 directories-list)))
         (week-raw (nth 2 directories-list))
         (week-number-only (replace-regexp-in-string "w" "" week-raw))
         (week (replace-regexp-in-string "w" "week-" week-raw))
         (refile-file (concat parent-dirs "/" week ".org"))
        ;; keybinding and name is ignored as this is temporary set variable
         (org-capture-templates
          `(("c" "flashcard-init-file" plain (file ,refile-file)
             "#+title: Week %(eval week-number-only)\n#+ANKI_DECK: %(nth 0 directories-list)-w%(eval week-number-only)\n\n* Ungrouped %?"
             :empty-lines 0
             :immediate-finish t
             )
            ("f" "flashcard" entry (file+headline ,refile-file "Ungrouped")
             "%?"
             :empty-lines 0
             :immediate-finish t
             )))
         (org-after-refile-insert-hook #'save-buffer)
         )
    ;; Refile logic
    (message "Refiling header to %s" refile-file)
    (if (not (file-exists-p refile-file))
        (org-capture nil "c"))
    (setq flashcard-buffer (find-file-noselect refile-file))

    (with-current-buffer flashcard-buffer
      (save-excursion
        (goto-char (point-min))
        ;; (when (org-find-exact-headline-in-buffer "Ungrouped")
        (when (search-forward "Ungrouped" nil t) ;; Temporary fix lmao unreliable if you have multiple instance of it
          (setq pos (point)))))

    (org-refile nil nil (list "auto-refile-flashcard" refile-file nil pos))
    ;; (funcall
    ;;  (async-lambda ()
    ;;    (with-current-buffer refile-file
    ;;      (setq org-anki-sync-request t)
    ;;      (save-window-excursion
    ;;        (org-refile-goto-last-stored)
    ;;        (org-mode)
    ;;        (await (org-anki-sync-entry)))
    ;;      (message "Done syncing to anki")
    ;;      )
    ;;     ))
    (save-window-excursion
      (org-refile-goto-last-stored)
      (org-anki-sync-entry)
      (sleep-for 1.25)
      (save-buffer)
      (kill-buffer)
      )
    (org-save-all-org-buffers)
))

(map! :after org
      :localleader

      (:prefix ("w" . "org-anki")
      :desc "Refile header to flashcard" "r" #'custom/refile-to-flashcard
      :desc "Sync entry" "s" #'org-anki-sync-entry
      :desc "Sync all entries" "a" #'org-anki-sync-all
      :desc "Convert a region to cloze" "c" #'org-anki-cloze-dwim
      ))

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
          org-roam-ui-open-on-start t
          org-roam-ui-export-repo "https://github.com/Sheape/sheape.github.io"
          ))
;; Latex configuration
;; Org-fragtog
(add-hook 'org-mode-hook 'org-fragtog-mode)

;; Latex
(setq TeX-engine 'luatex)
(setq +latex-viewers '(zathura))

(map! :map evil-tex-mode-map
      :n "m" 'evil-replace)
(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)
;; (map! :map tex-mode-map
;;       :leader
;;       (:prefix ("c" . "code")
;;        :desc "compile latex file" "C" #')
;;       )

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("org-reviewer-latex"
                 "\\documentclass{article}
                [NODEFAULTPACKAGES]
                [PACKAGES]
                [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 )))

(setq math-preview-command "/usr/bin/math-preview")

;; Org-publish
(require 'ox-publish)
(require 'org-roam-export)
;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org-roam-notes"
             :recursive t
             :base-directory org-roam-directory
             :publishing-function 'org-html-publish-to-html
             :publishing-directory (expand-file-name "./public" org-roam-directory)
             :with-author t             ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-latex t              ;; Include LaTeX formatting
             :with-tags nil             ;; Don't include tags
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil)))    ;; Don't include time stamp in file

;; Typst
(require 'typst-mode)

;; Rust LSP
(defun catppuccin-quantize-color (bruv)
  (message "catppuccin-quantize-color"))
(defun custom/cargo-run-release ()
  (interactive)
  (rustic-cargo-run-command "--release")
  (message "Release mode enabled"))

(map! :after rustic
      :localleader
      :map rustic-mode-map
      :prefix ("b" . "build")
      :desc "cargo run --release" "R" #'custom/cargo-run-release)

(add-hook 'rustic-mode-hook #'lsp-inlay-hints-mode)
(after! rustic
  (setq lsp-inlay-hint-enable t))

(defun org-element-with-disabled-cache (arg)
  (message "Keep pushing %s" arg))

;; Adjusting the home row keys for a more comfortable experience using workman layout with avy
(setq avy-keys '(?a ?s ?h ?t ?g ?y ?n ?e ?o ?i))
(setq avy-all-windows t)
(setq avy-timeout-seconds 1)

(use-package! tree-sitter-langs
  :after tree-sitter
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(yaml-mode . yaml))
)

;; Smart paren and region wrapping
(require 'smartparens-config)
(sp-local-pair 'org-mode "_" "_" :actions '(wrap))
(sp-local-pair 'org-mode "/" "/" :actions '(wrap))
(sp-local-pair 'org-mode "*" "*" :actions '(wrap))
(sp-local-pair 'org-mode "=" "=" :actions '(wrap))
(sp-local-pair 'org-mode "$" "$")

(map! :after embark
      :map embark-region-map
      :nv
      "{" #'sp-wrap-curly
      "[" #'sp-wrap-square
      "(" #'sp-wrap-round
      :desc "sp-wrap-angle" "<" #'(lambda () (interactive "*") (sp-wrap-with-pair "<"))
      :desc "sp-wrap-under" "_" #'(lambda () (interactive "*") (sp-wrap-with-pair "_"))
      :desc "sp-wrap-slash" "/" #'(lambda () (interactive "*") (sp-wrap-with-pair "/")))

(after! embark
  (defvar-keymap embark-general-map
    :parent embark-general-map
    "u" #'sp-unwrap-sexp))

(map! :map evil-visual-state-map
      "(" #'sp-wrap-round
      "[" #'sp-wrap-square
      "{" #'sp-wrap-curly)

(map! :after org
      :map evil-visual-state-map
      "*" #'(lambda () (interactive "*") (sp-wrap-with-pair "*"))
      "_" #'(lambda () (interactive "*") (sp-wrap-with-pair "_"))
      "/" #'(lambda () (interactive "*") (sp-wrap-with-pair "/")))

(setq display-line-numbers-type 'visual)
(map! :leader
      (:prefix ("t" . "toggle")
        :desc "Toggle imenu-list" "i" #'imenu-list-smart-toggle))
(after! imenu-list
  (setq imenu-list-focus-after-activation t))
;; (after! org
;;   (require 'org-rlinum)
;;   (org-rlinum-toggle))
(add-hook! 'org-mode-hook #'+org-init-keybinds-h)
(setq evil-snipe-override-evil-repeat-keys nil)
(setq doom-localleader-key ",")
(setq doom-localleader-alt-key "M-,")

(setq elcord-editor-icon 'emacs_icon)
(setq elcord-use-major-mode-as-main-icon t)
;; (elcord-mode)
(setq beacon-mode 1)

(use-package jtsx
  :mode (("\\.jsx?\\'" . jsx-mode)
         ("\\.tsx?\\'" . tsx-mode))
  :commands jtsx-install-treesit-language
  :hook ((jsx-mode . hs-minor-mode)
         (tsx-mode . hs-minor-mode))
  :custom
  (js-indent-level 2)
  (typescript-ts-mode-indent-offset 2)
  (jtsx-switch-indent-offset 0)
  (jtsx-indent-statement-block-regarding-standalone-parent nil)
  (jtsx-jsx-element-move-allow-step-out t)
  (jtsx-enable-jsx-electric-closing-element t)
  :config
  (defun jtsx-bind-keys-to-mode-map (mode-map)
    "Bind keys to MODE-MAP."
    (define-key mode-map (kbd "C-c C-j") 'jtsx-jump-jsx-element-tag-dwim)
    (define-key mode-map (kbd "C-c j o") 'jtsx-jump-jsx-opening-tag)
    (define-key mode-map (kbd "C-c j c") 'jtsx-jump-jsx-closing-tag)
    (define-key mode-map (kbd "C-c j r") 'jtsx-rename-jsx-element)
    (define-key mode-map (kbd "C-c <down>") 'jtsx-move-jsx-element-tag-forward)
    (define-key mode-map (kbd "C-c <up>") 'jtsx-move-jsx-element-tag-backward)
    (define-key mode-map (kbd "C-c C-<down>") 'jtsx-move-jsx-element-forward)
    (define-key mode-map (kbd "C-c C-<up>") 'jtsx-move-jsx-element-backward)
    (define-key mode-map (kbd "C-c C-S-<down>") 'jtsx-move-jsx-element-step-in-forward)
    (define-key mode-map (kbd "C-c C-S-<up>") 'jtsx-move-jsx-element-step-in-backward)
    (define-key mode-map (kbd "C-c j w") 'jtsx-wrap-in-jsx-element))

  (defun jtsx-bind-keys-to-jsx-mode-map ()
      (jtsx-bind-keys-to-mode-map jsx-mode-map))

  (defun jtsx-bind-keys-to-tsx-mode-map ()
      (jtsx-bind-keys-to-mode-map tsx-mode-map))

  (add-hook 'jsx-mode-hook 'jtsx-bind-keys-to-jsx-mode-map)
  (add-hook 'tsx-mode-hook 'jtsx-bind-keys-to-tsx-mode-map))

(setq codeium/metadata/api_key "ec83479e-3fad-45c0-a092-660993b41ce9")
;; we recommend using use-package to organize your init.el
(use-package codeium
    :init
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    (setq codeium-api-enabled
        (lambda (api)
            (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
    (defun my-codeium/document/text ()
        (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
    (defun my-codeium/document/cursor_offset ()
        (codeium-utf8-byte-length
            (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
    (setq codeium/document/text 'my-codeium/document/text)
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

(use-package company
    :defer 0.1
    :config
    (global-company-mode t)
    (setq-default
        company-idle-delay 0.05
        company-require-match nil
        company-minimum-prefix-length 0
        company-frontends '(company-preview-frontend)
        ))
