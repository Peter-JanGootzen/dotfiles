(require 'package)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

; Evil >:D
(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(require 'evil-numbers)
;(setq evil-leader/in-all-states 1)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(evil-mode 1)

; Let 5 lines before/after cursor during scroll
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

; Enable line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

; Syntax highlighting
(require 'flycheck)
(global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))
(require 'flycheck-rtags)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)


; Give rainbow colors to delimiters like parentheses and brackets
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Programming
; Completion framework
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
; Set completion to only having to press tab
(company-tng-configure-default)

; C and C++

; Irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-irony))

(setq company-idle-delay 0)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

; CMake
(require 'cmake-ide)
(require 'cmake-mode)
(cmake-ide-setup)

; Tags
(require 'rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(require 'helm-rtags)
(setq rtags-use-helm t)

; Powerline
(require 'powerline)
(powerline-default-theme)

; Git integration
(require 'magit)
(require 'evil-magit)

; Searching things
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(define-key global-map [remap execute-extended-command] 'helm-M-x)
(define-key global-map [remap apropos-command] 'helm-apropos)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

; Project plugin that goes to git root automaticly
(require 'projectile)
;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;(projectile-mode +1)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

; Disable the GUI stuff
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

; Show the current line more clearly
(global-hl-line-mode 1)

; Font
(add-to-list 'default-frame-alist
             '(font . "xos4 Terminus 10"))

;;; Keybindings
(evil-leader/set-key "f f" 'helm-find-files)
(evil-leader/set-key "f p" 'helm-projectile)
(evil-leader/set-key "p" 'helm-projectile-switch-project)
(evil-leader/set-key "<SPC>" 'save-buffer)

; Set backup and auto save folder
(setq backup-directory-alist '(("." . "~/.bak/")))
(setq auto-save-file-name-transforms `((".*" "~/.bak/" t)))

; Disable the Emacs startup screen
(setq inhibit-startup-screen t)

; Theming
(load-theme 'zerodark t)
(zerodark-setup-modeline-format)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zerodark-theme org-plus-contrib flycheck-rtags helm-rtags projectile cmake-mode helm fzf flycheck-irony company-rtags irony auto-complete-clang rtags cmake-ide evil-magit magit powerline ## rainbow-delimiters flycheck smooth-scrolling evil-leader company evil-numbers evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
