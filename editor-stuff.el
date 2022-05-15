;; Helm, Company and Company-tabnine
(global-set-key (kbd "M-x") 'helm-M-x)
(use-package helm
  :straight t
  :init (helm-mode t)
  :config (setq helm-full-frame t))

(use-package swiper-helm
  :straight t
  :init
  :bind (("<leader> s d" . swiper-helm)))

(use-package company
  :straight t
  :init
  (setq global-company-mode t)
  (setq company-mode t)
  :config
  (setq company-show-numbers t)
  (setq company-idle-delay 0))  
(with-eval-after-load 'company
  (define-key company-active-map
              (kbd "TAB")
              #'company-complete-common-or-cycle)
  (define-key company-active-map
              (kbd "<backtab>")
              (lambda ()
                (interactive)
                (company-complete-common-or-cycle -1))))

(use-package company-tabnine
  :straight t
  :config
  (add-to-list 'company-backends #'company-tabnine))


;;lsp-mode and syntax highlighting BS ("god i hope this goes right" -me April 20, 2022 at 2:17 am sleep deprived :)

(use-package lsp-mode
  :straight t
  :init
  (setq lsp-mode t)
  (setq lsp-keymap-prefix "<leader> l s")
  :hook ((rust-mode . lsp)
	 (python-mode . lsp)
	 (javascript-mode .lsp)
	 (elixir-mode . lsp)
	 (erlang-mode . lsp)
	 (typescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :straight t
  :init (lsp-ui-mode t)
  :commands lsp-ui-mode)
(use-package helm-lsp
  :straight t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-java
  :straight t)
  
(use-package dap-mode
  :straight t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;;which-key integration
(use-package which-key
  :straight t
  :config
    (which-key-mode))


;; magit, projectile, and treemacs
(use-package magit
  :straight t)




(use-package treemacs
  :straight t
  :bind (("<leader> o p" . treemacs)))
(use-package treemacs-evil :straight t)
(use-package treemacs-magit :straight t)
(use-package treemacs-all-the-icons :straight t)
