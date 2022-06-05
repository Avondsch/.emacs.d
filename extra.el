;;for extra configuration that doesnt necessarily fall into themeing, ide, org-mode, and evil-mode configuration.


;;elcord
(use-package elcord
	     :straight t
	     :init (setq elcord-mode t))

;;ibuffer
(use-package ibuffer
  :straight t
  :init (setq ibuffer-mode t)
  :config
 (setq ibuffer-saved-filter-groups
      '(("main"
         ("modified" (and
                      (modified . t)
                      (visiting-file . t)))
         ("code" (or (filename . "/projects/")
                     (filename . "/git-repos/")
                     (filename . "/code/")))
        ;; ("org" (mode . org-mode))
         ("dired" (mode . dired-mode))
         ("help" (or (name . "\*Help\*")
                     (name . "\*Apropos\*")
                     (name . "\*info\*")
                     (mode . help-mode)))
         ("internal" (name . "^\*.*$"))
         ("other" (name . "^.*$")))))

  (add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "main")))

  :bind
  (("<leader> b b" . ibuffer)))

(use-package all-the-icons-ibuffer
  :straight t
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))


