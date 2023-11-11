;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; use-package
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
(setq use-package-compute-statistics t)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; Disable splash screen
(setq inhibit-startup-screen t)

;; Font
(set-face-attribute 'default nil :font "Hack-10")

;; Theme
(load-theme 'modus-operandi t)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Enable line numbering by default
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Automatically pair parentheses
(electric-pair-mode t)

(use-package corfu
  ;; Optional customizations
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

;; Miscellaneous options
(setq use-dialog-box nil)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(setq history-length 25)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)
(blink-cursor-mode -1)
(setq comint-scroll-to-bottom-on-output t)

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Languages
(use-package racket-mode)

(add-hook 'after-init-hook 'recentf-open-files)

(setq gdb-many-windows t)
(setq gdb-show-main t)
(windmove-default-keybindings)
(setq windmove-wrap-around t)

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(add-hook 'eglot-managed-mode-hook
	  (lambda () (add-hook 'before-save-hook 'eglot-format-buffer)))

(add-to-list 'load-path "~/.config/emacs/manual")
;; (setq disaster-assembly-mode 'nasm-mode)
;; (require 'disaster)
;; (keymap-global-set "C-c d" 'disaster)

(setq gdb-debuginfod-enable-setting nil)

(use-package org-superstar)

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; This is usually the default, but keep in mind it must be nil
(setq org-hide-leading-stars nil)
;; This line is necessary.
(setq org-superstar-leading-bullet ?\s)
;; If you use Org Indent you also need to add this, otherwise the
;; above has no effect while Indent is enabled.
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-superstar-special-todo-items t)

(use-package which-key)
(which-key-mode)

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq-local c-macro-cppflags "-x c++")))
