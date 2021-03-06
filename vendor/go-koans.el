(defun go-koans-run ()
  "Running Go koans test from"
  (interactive)
  (save-buffer)
  (setq output (shell-command-to-string "go test"))

  (with-current-buffer (get-buffer-create "*go-koans*")
    (erase-buffer)
    (insert output))


  (when (string-match "\\(about_[A-Za-z0-9_]*.go\\):\\([0-9]+\\)" output)

    (let
        ((line (if (fboundp 'string-to-number)
                   (string-to-number (match-string 2 output))
                   (string-to-int (match-string 2 output))))
         (file (expand-file-name (match-string 1 output))))

      (find-file (expand-file-name file))
      (goto-line line)


            ;;; if expand region exists run it
      ;; if you don't have it https://github.com/magnars/expand-region.el
      (if (fboundp 'er/expand-region)
          (search-forward "__")
        (er/expand-region 1))
      )))


(eval-after-load 'go-mode
  '(define-key go-mode-map (kbd "C-c C-r") 'go-koans-run))

(provide 'go-koans)
