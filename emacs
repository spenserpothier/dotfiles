;; Package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(package-initialize)
;; Packages
(ensure-package-installed 'evil
			  'powerline
			  'powerline-evil
			  'auto-complete
			  'key-chord
			  'helm
			  'helm-ls-git
			  'projectile
			  'helm-projectile
			  'org-bullets
			  'org-beautify-theme)

;; Evil mode (vim emulation within emacs)
(evil-mode t)

;; Powerline evilmode
(powerline-evil-vim-color-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm stuff
(require 'helm-config)
(helm-mode t)
(helm-projectile-on)

;; Use helm for buffer navigation
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;; Use helm for bookmarks
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
;; Use helm for M-x commands
(global-set-key (kbd "C-x m") 'helm-M-x)

;; Tabcomplete in find file
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x C-f") 'helm-find-files)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use jk as escape for evil mode 
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" (lambda() (interactive) (evil-normal-state) (evil-forward-char)))
(key-chord-mode 1)

;; GUI settings
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
