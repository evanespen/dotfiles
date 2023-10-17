(use-package company
  :ensure t
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode t)
  )

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  )

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  )

;; if you are ivy user
(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol
  )

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  )

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t
  )
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :ensure t
    :config
    (which-key-mode))


(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package pyvenv
  :ensure t
  :after python
  :hook ((python-mode . pyvenv-mode)
         (python-mode . (lambda ()
                          (if-let ((pyvenv-directory (find-pyvenv-directory (buffer-file-name))))
                              (pyvenv-activate pyvenv-directory))
                          (lsp))))
  :custom
  (pyvenv-default-virtual-env-name "venv")
  (pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:"
                                                         pyvenv-virtual-env-name "]")))
  :preface
  (defun find-pyvenv-directory (path)
    "Checks if a pyvenv directory exists."
    (cond
     ((not path) nil)
     ((file-regular-p path) (find-pyvenv-directory (file-name-directory path)))
     ((file-directory-p path)
      (or
       (seq-find
        (lambda (path) (file-regular-p (expand-file-name "pyvenv.cfg" path)))
        (directory-files path t))
       (let ((parent (file-name-directory (directory-file-name path))))
         (unless (equal parent path) (find-pyvenv-directory parent))))))))
