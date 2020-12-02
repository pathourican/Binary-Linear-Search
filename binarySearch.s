	;; Patrick Hourican
	;; pjh4as
	;; 11/4/2020
	;; binarySearch.s

	global binarySearch

	section .text

	;; first param, int array pointer - rdi
	;; second param, beginning of array - rsi
	;; third param, end of array - rdx
	;; fourth param, target in array - ecx

	;; r10 = middle value

binarySearch:

	cmp	rdx, rsi	; if right is <= left, value is not in list
	jl	notFound
	
	mov	r10, rsi	; move left index value into middle reg
	add	r10, rdx	; add right register to middle reg
	shr	r10, 1		; divide by 2 to get middle value
	
	cmp	ecx, [rdi+r10*4] ; compare middle value to target value
	je	done		; end if equal

	cmp	ecx, [rdi+r10*4]
	jl	right		; make middle the right index
	jg	left		; make middle the left index

right:
	dec	r10		; decrement middle by 1 and make it the new end value
	mov	rdx, r10

	cmp	ecx, [rdi+r10*4]
	je	done
	
	call	binarySearch	; recursive call
	jmp	end

left:	
	inc	r10		; increment middle by 1 and make it the new beginning value
	mov	rsi, r10

	cmp	ecx, [rdi+r10*4]
	je	done

	call 	binarySearch	; recursive call
	jmp	end
	
notFound:
	mov	rax, -1		; move -1 into reg if not found
	jmp	end

done:
	mov	rax, r10	; move middle into reg if found
	jmp	end


end:
	ret			; return index in rax
