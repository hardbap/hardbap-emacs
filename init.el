(setq inhibit-startup-message t)

; no scrollbar
(scroll-bar-mode -1)

; no toolbar
(tool-bar-mode -1)

; no menubar
(menu-bar-mode -1)

; blink cursor
(blink-cursor-mode t)

; highlight current line
(global-hl-line-mode t)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq backup-inhibited t)

; save cursor position within files
(require 'saveplace)
(setq save-place-file "~/.emacs.d/.saveplace")
(setq-default save-place t)

; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode 1)

; tabs and indentation
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)

; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

; whitespace
;(global-whitespace-mode t)
;(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; show column number in bar
(column-number-mode t)

; selection
(delete-selection-mode t)

; show marks as selections
(setq transient-mark-mode t)

; highlight matching parens
(show-paren-mode t)

; highlight incremental search
(defconst search-highlight t)

; no newlines past EOF
(setq next-line-add-newlines nil)

; apply syntax highlighting to all buffers
(global-font-lock-mode t)

; wrap lines in a tasteful way
(global-visual-line-mode 1)

; line numbering
(require 'linum)
(global-linum-mode 0)
(setq linum-format "%d ") ; space after line number
(global-linum-mode 1)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

; Make yes-or-no questions answerable with 'y' or 'n'
(fset 'yes-or-no-p 'y-or-n-p)

; to be able to C-x without going all the way to 'x' which sucks on
; a Dvorak keyboard layout
(keyboard-translate ?\C-t ?\C-x)

; To be able to M-x without meta
(global-set-key (kbd "C-x c") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-n" 'goto-line)
(global-set-key (kbd "C-x t") 'dumb-jump-go)
(global-set-key (kbd "C-x -") 'dumb-jump-back)
(global-set-key (kbd "C-x p") 'dumb-jump-go-prompt)
(global-set-key (kbd "C-x e") 'ace-window)


(setq mac-option-modifier 'meta)

(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(setq enh-ruby-deep-indent-paren nil)
(setq enh-ruby-indent-level 2)
(setq enh-ruby-add-encoding-comment-on-save nil)

(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-t") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)


; Interactively Do Things
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
;; Display ido results vertically, rather than horizontally
  (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
  (add-hook 'ido-setup-hook 'ido-define-keys)

(projectile-rails-global-mode)
(add-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'chruby)

(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet yaml-mode rspec-mode ace-window docker dockerfile-mode dumb-jump color-theme-sanityinc-tomorrow magit projectile-rails sourcerer-theme projectile grizzl flymake-ruby enh-ruby-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-x g") 'magit-status)
(setq smerge-command-prefix "\C-cv")
(require 'rubocop)
(add-hook 'enh-ruby-mode-hook #'rubocop-mode)
;;(add-hook 'before-save-hook 'rubocop-autocorrect-current-file)

;;(add-hook 'enh-ruby-mode-hook
;;          (lambda () (add-hook 'before-save-hook 'rubocop-autocorrect-current-file nil 'local)))

(dumb-jump-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(set-frame-font "Hack 14" nil t)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(yas-global-mode 1)
; start a server for usage with emacsclient
(add-hook 'after-init-hook 'server-start)
