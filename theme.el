;;themeing for emacs

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode t)

(defvar efs/default-font-size 100)
(defvar efs/default-variable-font-size 100)

(set-face-attribute 'default nil :font "Iosevka custom" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Iosevka custom" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Iosevka custom" :height efs/default-variable-font-size)

(defun dw/replace-unicode-font-mapping (block-name old-font new-font)
  (let* ((block-idx (cl-position-if
                         (lambda (i) (string-equal (car i) block-name))
                         unicode-fonts-block-font-mapping))
         (block-fonts (cadr (nth block-idx unicode-fonts-block-font-mapping)))
         (updated-block (cl-substitute new-font old-font block-fonts :test 'string-equal)))
    (setf (cdr (nth block-idx unicode-fonts-block-font-mapping))
          `(,updated-block))))

(use-package unicode-fonts
  :straight t
  :config
  ;; Fix the font mappings to use the right emoji font
  (mapcar
    (lambda (block-name)
      (dw/replace-unicode-font-mapping block-name "Apple Color Emoji" "Noto Color Emoji"))
    '("Dingbats"
      "Emoticons"
      "Miscellaneous Symbols and Pictographs"
      "Transport and Map Symbols"))
  (unicode-fonts-setup))


;;theme and modeline
(use-package doom-themes
  :straight t
  :init (load-theme 'doom-nord))

(straight-use-package
  '(everforest-hard-dark-theme) :type git :repo "https://git.sr.ht/~theorytoe/everforest-hard-dark-theme")

;;(use-package nano-modeline
  ;;:straight t
  ;;:init (setq nano-modeline-mode t)
;;:config(setq nano-modeline-position 1))

(use-package doom-modeline
  :straight t)

;;smooth scrolling (it is a necessity)
(use-package smooth-scrolling
  :straight t
  :init (setq smooth-scrolling-mode t))


;;transparency
  (set-frame-parameter (selected-frame) 'alpha '(95 . 65))
  (add-to-list 'default-frame-alist '(alpha . (95 . 65)))
