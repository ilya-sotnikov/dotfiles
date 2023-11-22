;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
(setq use-package-compute-statistics t)

(use-package emacs
  :init
  (setq package-install-upgrade-built-in t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq inhibit-startup-screen t)
  (set-frame-font "Hack 11" nil t)
  (load-theme 'modus-operandi t)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  ;; automatically pair parentheses
  (electric-pair-mode t)
  ;; additional windows for gdb debugging
  (setq gdb-many-windows t)
  ;; move around windows with S-<arrow>
  (windmove-default-keybindings)
  (setq windmove-wrap-around t)
  ;; miscellaneous
  (setq use-dialog-box nil)
  (setq window-resize-pixelwise t)
  (setq frame-resize-pixelwise t)
  (save-place-mode t)
  (setq history-length 25)
  (savehist-mode t)
  (recentf-mode t)
  (defalias 'yes-or-no #'y-or-n-p)
  (blink-cursor-mode 0)
  (setq subword-mode t)
  (setq c-default-style "linux"
	      c-basic-offset 2
	      indent-tabs-mode nil
	      tab-width 2)
  :bind ("C-c o" . ff-find-other-file))



;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-cycle t))

;; Persist history over emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations... (vertico)
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

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; company completion
(use-package company
  :hook (after-init . global-company-mode))

(use-package consult
  :config
  (vertico-mode)
  (setq completion-styles '(substring basic))
  :bind (("C-c f g" . consult-ripgrep)
	 ("C-c f f" . consult-fd)))

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(add-hook 'after-init-hook 'recentf-open-files)

(use-package eglot
  :hook
  (eglot-managed-mode . (lambda () (add-hook 'before-save-hook 'eglot-format-buffer)))
  :bind (("C-c c a" . eglot-code-actions)
	 ("C-c c r" . eglot-rename)))

(use-package python-black
  :demand t
  :after python 
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

;; (add-to-list 'load-path "~/.config/emacs/manual")
;; (setq disaster-assembly-mode 'nasm-mode)
;; (require 'disaster)
;; (keymap-global-set "C-c d" 'disaster)

(setq gdb-debuginfod-enable-setting nil)

(use-package org-superstar
  :init
  ;; This is usually the default, but keep in mind it must be nil
  (setq org-hide-leading-stars nil)
  ;; This line is necessary.
  (setq org-superstar-leading-bullet ?\s)
  ;; If you use Org Indent you also need to add this, otherwise the
  ;; above has no effect while Indent is enabled.
  (setq org-indent-mode-turns-on-hiding-stars nil)
  (setq org-superstar-special-todo-items t)
  :hook
  (org-mode . org-superstar-mode))

(use-package which-key
  :config
  (which-key-mode))


(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq-local c-macro-cppflags "-x c++")))

(use-package yasnippet
  :config
  (yas-global-mode 1)
  :hook
  (eglot-managed-mode . (lambda ()
			  (add-to-list 'company-backends
				       '(company-capf :with company-yasnippet)))))

(use-package yasnippet-snippets)

(use-package flymake
  :bind (("M-n" . flymake-goto-next-error)
	 ("M-p" . flymake-goto-prev-error)))

(use-package cmake-mode)
