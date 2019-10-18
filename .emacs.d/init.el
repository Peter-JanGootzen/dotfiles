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
(evil-mode 1)

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)

(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

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

; Powerline
(require 'powerline)
(powerline-default-theme)

; Git integration
(require 'magit)
(require 'evil-magit)


; Disable the GUI stuff
;(menu-bar-mode -1)
;(toggle-scroll-bar -1)
;(tool-bar-mode -1)

; Show the current line more clearly
(global-hl-line-mode 1)



; Font
(add-to-list 'default-frame-alist
             '(font . "xos4 Terminus 10"))

; Set backup folder
;(setq backup-directory-alist
;      `((".*" "~/.bak/" t)))
;(setq auto-save-file-name-transforms
;      `((".*" "~/.bak/" t)))

; Disable the Emacs startup screen
(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-irony company-rtags irony auto-complete-clang rtags cmake-ide evil-magit magit powerline ## rainbow-delimiters flycheck smooth-scrolling evil-leader company evil-numbers evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
