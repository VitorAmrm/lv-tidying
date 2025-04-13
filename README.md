# Exercícios de Tidy First? em Perl

Este documento reúne exercícios baseados no livro *Tidy First? Minirrefatorações para um melhor design de software*, utilizando a linguagem Perl. Cada exercício contém um trecho de código original e será seguido de uma proposta de refatoração feita por mim, acompanhada de análise e sugestões.

---

## Exercício 1

### Enunciado
Melhore a legibilidade e separação de responsabilidades do seguinte trecho de código:

```perl
sub process_data {
    my $input = shift;
    my @lines = split /\n/, $input;
    my @results;
    foreach my $line (@lines) {
        chomp($line);
        if ($line =~ /error/i) {
            push @results, "Error: $line";
        } else {
            push @results, "OK: $line";
        }
    }
    return join("\n", @results);
}
```


## Exercício 2

### Enunciado
Refatore o seguinte código, melhorando sua legibilidade e modularização. Use outros tipos de **tidyings** do livro, como:

- **Avoid Deep Nesting** (Evitar aninhamento profundo)
- **Substitute Conditionals with Polymorphism** (Substituir condicionais por polimorfismo)
- **Replace Magic Numbers with Named Constants** (Substituir números mágicos por constantes nomeadas)

### Código Original

```perl
sub check_name {
    my $name = shift;
    if (length($name) > 0) {
        if ($name eq "admin") {
            return 1;
        }
    }
    return 0;
}

sub greet_user {
    my $name = shift;
    my $greeting = "Hello " . $name;
    if (check_name($name)) {
        $greeting .= ", you have admin access.";
    }
    return $greeting;
}
```

## Exercício 3

### Enunciado
Refatore o seguinte código, melhorando a legibilidade, concisão e eficiência. Use os seguintes **tidyings**:

- **Replace Loops with Map/Filter** (Substituir loops por `map`/`grep`).
- **Simplify Conditionals** (Simplificar condicionais).
- **Avoid Redundant Variables** (Evitar variáveis desnecessárias).

### Código Original

```perl
sub process_numbers {
    my @numbers = @_;
    my @positive_numbers;

    foreach my $number (@numbers) {
        if ($number > 0) {
            push @positive_numbers, $number;
        }
    }

    my @doubled_numbers;
    foreach my $number (@positive_numbers) {
        my $doubled = $number * 2;
        push @doubled_numbers, $doubled;
    }

    return @doubled_numbers;
}
```

## Exercício 4

### Enunciado
Refatore o seguinte código para melhorar a legibilidade, modularização e eliminar repetições. Aplique os seguintes **tidyings**:

- **Extract Function**
- **DRY (Don't Repeat Yourself)**
- **Use Guard Clauses**

### Código Original

```perl
sub notify_user {
    my ($user_type, $account_status) = @_;

    if ($user_type eq 'admin') {
        if ($account_status eq 'active') {
            return "Admin access granted.";
        } elsif ($account_status eq 'inactive') {
            return "Admin account inactive.";
        } else {
            return "Unknown admin status.";
        }
    }

    if ($user_type eq 'guest') {
        if ($account_status eq 'active') {
            return "Guest access granted.";
        } elsif ($account_status eq 'inactive') {
            return "Guest account inactive.";
        } else {
            return "Unknown guest status.";
        }
    }

    return "Unknown user type.";
}
```

## Exercício 5

### Enunciado
Refatore o código abaixo para melhorar clareza, coesão e separar responsabilidades. Aplique os seguintes **tidyings**:

- **Separate Concerns**
- **Introduce Meaningful Names**
- **Extract Value Object** (quando fizer sentido)
- **Inline Temporary Variable** (se necessário)

### Código Original

```perl
sub generate_report {
    my ($name, $score) = @_;

    my $greeting = "Hello " . $name . "!";
    my $status;

    if ($score >= 90) {
        $status = "Excellent";
    } elsif ($score >= 75) {
        $status = "Good";
    } elsif ($score >= 60) {
        $status = "Satisfactory";
    } else {
        $status = "Needs Improvement";
    }

    return $greeting . " Your score is $score. Performance: $status.";
}
