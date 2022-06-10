;;IDE configurations for emacs.

;;No littering
;;(use-package no-littering)
;;(setq auto-save-file-name-transforms
  ;;    `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))


;; Helm, and Company mode
(global-set-key (kbd "M-x") 'helm-M-x)
(use-package helm
  :straight t
  :init (helm-mode t))

(use-package swiper-helm
 :straight t
  :init
  :bind (("<leader> s d" . swiper-helm)))

(use-package company
:straight t
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bin
  d (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
:straight t
  :hook (company-mode . company-box-mode))



;;syntax highlighting via tree-sitter and lsp-mode
(use-package tree-sitter
  :straight t)
(use-package tree-sitter-langs
  :straight t)
(use-package rainbow-delimiters
  :straight t
:hook (prog-mode . rainbow-delimiters-mode))

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
:straight t
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-java
  :straight t)


(use-package lsp-ui
:straight t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package c++-mode
  :mode "\\.cpp\\'"
  :hook (c++-mode . lsp-deferred)
  (c++-mode . tree-sitter-mode)
  (c++-mode . tree-sitter-hl-mode)
  (c++-mode . company-mode))

(use-package java-mode
  :mode "\\.java\\'"
  :hook (java-mode . lsp-deferred)
  (java-mode . tree-sitter-mode)
  (java-mode . tree-sitter-hl-mode)
  (java-mode . company-mode))

(use-package nix-mode
  :straight t
  :mode "\\.nix\\'"
  :hook (nix-mode . lsp-deferred)
  (nix-mode . tree-sitter-mode)
  (nix-mode . tree-sitter-hl-mode)
  (nix-mode . company-mode))





;;Magit, Treemacs, and projectile

;;(use-package magit
  ;;:commands magit-status
  ;;:custom
  ;;(magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
;;(use-package forge
  ;;:after magit)





(use-package projectile
:straight t
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package helm-projectile
  :straight t
  :after projectile
  :config (helm-projectile-mode))


(use-package treemacs
  :straight t
  :bind (("<leader> o p" . treemacs)))
(use-package treemacs-evil :straight t)
(use-package treemacs-magit :straight t)
(use-package treemacs-all-the-icons :straight t)

;;sublimity
(use-package sublimity
  :straight t)
