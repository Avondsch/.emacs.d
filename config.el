;;removing visual disturbances
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)

(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;font stuff
(defvar efs/default-font-size 90)
(defvar efs/default-variable-font-size 90)

(set-face-attribute 'default nil :font "Dina" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Dina" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Dina" :height efs/default-variable-font-size :weight 'regular)

;;package configuration starts here

(use-package which-key
  :straight t
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

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


;; Tabs

(use-package centaur-tabs
  :straight t
  :bind (("<leader> t c" . centaur-tabs-mode))
  :config
  (setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 25
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•"))

;;(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward
  ;;                                             (kbd "g <left>")  'centaur-tabs-backward
    ;;                                           (kbd "g <down>")  'centaur-tabs-forward-group
      ;;                                         (kbd "g <up>")    'centaur-tabs-backward-group)

;;smooth scrolling
(use-package smooth-scrolling
  :straight t
  :init (setq smooth-scrolling-mode t))


;;powerline
(use-package powerline
  :straight t
  :init
  (powerline-default-theme))
(use-package airline-themes
  :straight t
  :config
  (setq airline-helm-colors nil)
  (setq airline-cursor-colors t))

;;themeing
(use-package gruvbox-theme
  :straight t)
(use-package doom-themes
  :straight t)
;;:init (load-theme 'atom-one-light-theme t)
(use-package all-the-icons
  :straight t)

(use-package atom-one-light-theme
  :straight (:type git :host github :repo "jonathanchu/atom-one-light-theme"))
 
