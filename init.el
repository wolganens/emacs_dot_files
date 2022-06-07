(require 'package)
(require 'smartparens-config)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
                   '("org" . "http://orgmode.org/elpa/") t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)

(add-to-list 'load-path "~/.emacs.d/site-lisp/restclient/")
(require 'restclient)

(load-theme 'dracula t)
(set-face-attribute 'font-lock-type-face nil :weight 'normal)
(package-initialize)
(add-hook 'clojure-mode-hook #'smartparens-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist '((fullscreen . maximized)))
 '(org-agenda-files '("~/org/home.org"))
 '(package-selected-packages
   '(restclient-test clj-refactor company rainbow-delimiters smartparens paredit cider magit projectile flx-ido doom-modeline clojure-mode all-the-icons-dired)))
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(tool-bar-mode -1)
(show-paren-mode 1)
(require 'doom-modeline)
(doom-modeline-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(global-set-key (kbd "<C-right>") (lambda () (interactive) (sp-forward-slurp-sexp)))
(global-set-key (kbd "<C-left>") (lambda () (interactive) (sp-backward-slurp-sexp)))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#FF1493")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(require 'smartparens-config)
(smartparens-global-strict-mode 1)
(sp-pair "[" "]" :insert "}")
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'clojurescript-mode-hook 'smartparens-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-mode)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically t)
