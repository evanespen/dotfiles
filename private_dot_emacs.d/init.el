(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" default))
 '(global-emojify-mode t)
 '(ispell-dictionary nil)
 '(ivy-mode t)
 '(line-number-mode nil)
 '(package-selected-packages
   '(rainbow-mode svelte-mode web-mode emmet-mode emmet pyvenv company ivy yasnippet rainbow-delimiters yaml-mode dockerfile-mode ox-gfm lsp-pyright which-key dap-mode lsp-ivy lsp-ui lsp-mode default-text-scale ace-window vterm all-the-icons highlight-thing smex textsize ox-ioslide emojify multiple-cursors ox-reveal undo-tree vundo yasnippet-snippets org-bullets ivy-rich counsel helm doom-modeline elpy smartparens doom-themes use-package))
 '(tetris-tty-colors
   ["light slate blue" "white" "gold" "magenta" "cyan" "green" "red"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-font "Hasklug Nerd Font Mono 12" nil t)



(setq inhibit-startup-message t) 
(menu-bar-mode -1) 
(scroll-bar-mode -1) 
(tool-bar-mode -1)
(delete-selection-mode)
(show-paren-mode 1)
(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(defalias 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode 1)

(defun reload ()
  (interactive)
  (load-file "~/.emacs.d/init.el")
  )


(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-molokai t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-molokai") ; Use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package smartparens
  :ensure t
  :hook prog-mode
  )

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))


(use-package all-the-icons
  :ensure t
  )

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t)
  )

(use-package rainbow-delimiters
    :ensure t
    :init (rainbow-delimiters-mode 1)
  )


(use-package org
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode))
  )

(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  )


(use-package yasnippet                  ; Snippets
  :ensure t
  :config
  (setq
   yas-verbosity 1                      ; No need to be so verbose
   yas-wrap-around-region t)

  (with-eval-after-load 'yasnippet
    (setq yas-snippet-dirs '(yasnippet-snippets-dir)))

  (yas-reload-all)
  (yas-global-mode))

(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)


(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  :bind
  ("C-`" . undo-tree-undo)
  ("M-`" . undo-tree-redo)
  )


(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root "file://C/Users/e077401/Documents/.reveal-js/dist/reveal.js")
  )


(use-package ox-ioslide
  :ensure t
  )
(use-package makey
  :ensure t
  )


(use-package multiple-cursors
  :ensure t
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-|" . mc/mark-all-like-this)
  )


(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode)
  )


(use-package textsize
  :ensure t
  :commands textsize-mode
  :init (textsize-mode)
  )

(use-package highlight-thing
  :ensure t
  :config
  (global-highlight-thing-mode)
  )

(use-package vterm
    :ensure t)

(use-package ace-window
  :ensure t
  :bind
  ("M-o" . ace-window)
  )

(use-package ox-gfm
  :ensure t
  )

(use-package dockerfile-mode
  :ensure t
  )

(use-package yaml-mode
  :ensure t
  )

(use-package rainbow-mode
  :ensure t
  :init
  (rainbow-mode 1)  
  )


(load "~/.emacs.d/screen.el")
(load "~/.emacs.d/ivy.el")
(load "~/.emacs.d/lsp.el")
(load "~/.emacs.d/web.el")


(global-set-key (kbd "C-x g") 'project-find-file)
(global-set-key (kbd "C-z") 'project-find-file)
