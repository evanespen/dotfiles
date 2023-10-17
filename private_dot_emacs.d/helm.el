(use-package helm
  :ensure t
  :config
  (setq helm-split-window-inside-p t)
  (setq helm-use-frame-when-more-than-two-windows nil)
  :bind (([tab] . helm-execute-persistent-action))
  ;; (helm-autoresize-mode 1)
  )

(use-package helm-mode
    :config (helm-mode 1))

(use-package helm-command
    :bind (("M-x" . helm-M-x)))

(use-package helm-files
    :bind (("C-x C-f" . helm-find-files)))

(use-package helm-buffers
    :bind (("C-x C-b" . helm-buffers-list)
           ("M-s m" . helm-mini))
    :config (setq helm-buffer-max-length nil))

(use-package helm-occur
    :bind (("M-s o" . helm-occur)))

(use-package helm-imenu
    :bind (("M-s i" . helm-imenu))
    :config (setq imenu-max-item-length 120))

(use-package helm-bookmarks
    :bind (("M-s b" . helm-bookmarks)))
